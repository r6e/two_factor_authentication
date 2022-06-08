# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem"s dependencies in devise_ip_filter.gemspec
gemspec

env_rails_version = ENV.fetch("RAILS_VERSION", "default")

rails_version =
  case env_rails_version
  when "master"
    { github: "rails/rails" }
  when "default"
    "~> 6.1"
  else
    env_rails_version
  end

gem "rails", rails_version

gem "net-smtp", require: false if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.0.0")

gem "rake", "~> 13.0"

group :test, :development do
  gem "rubocop", "~> 1.21"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rake"
  gem "rubocop-rspec"
  gem "rubocop-thread_safety"
  gem "sqlite3"
end

group :test do
  gem "ammeter"
  gem "rack_session_access"
  gem "rspec", "~> 3.0"
  gem "rspec-rails"
  gem "test-unit", "~> 3.0"
end
