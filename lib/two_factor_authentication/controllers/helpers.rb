module TwoFactorAuthentication
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        before_action :handle_two_factor_authentication
      end

      private

      def handle_two_factor_authentication
        unless devise_controller?
          Devise.mappings.keys.flatten.any? do |scope|
            if signed_in?(scope) and warden.session(scope)[::TwoFactorAuthentication::NEED_AUTHENTICATION]
              handle_failed_second_factor(scope)
            end
          end
        end
      end

      def handle_failed_second_factor(scope)
        if request.format&.html?
          session["#{scope}_return_to"] = request.original_fullpath if request.get?
          redirect_to two_factor_authentication_path_for(scope)
        elsif request.format&.json?
          session["#{scope}_return_to"] = root_path(format: :html)
          render json: {
            redirect_to: two_factor_authentication_path_for(scope),
            authentication_type: send("current_#{scope}")&.direct_otp ? :otp : :totp
          }, status: :unauthorized
        else
          head :unauthorized
        end
      end

      def two_factor_authentication_path_for(resource_or_scope = nil)
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        namespace = if Devise.available_router_name
          send(Devise.available_router_name)
        else
          self
        end
        change_path = "#{scope}_two_factor_authentication_path"
        namespace.send(change_path)
      end

    end
  end
end

module Devise
  module Controllers
    module Helpers
      def is_fully_authenticated?
        !session["warden.user.user.session"].try(:[], ::TwoFactorAuthentication::NEED_AUTHENTICATION)
      end
    end
  end
end
