source 'https://rubygems.org'

# Specify your gem's dependencies in devise_ip_filter.gemspec
gemspec

rails_version = ENV["RAILS_VERSION"] || "default"

case rails_version
when 'master'
  gem 'rails', {github: 'rails/rails'}
when 'default'
  gem 'rails', '~> 7.0.3'
else
  gem 'rails', *rails_version.split(', ')
end

# gem "railties", rails # rspec-rails tries to grab the absolute latest on GitHub actions

if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('3.0.0')
  gem 'net-smtp', require: false
end

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :test do
  gem 'rack_session_access'
  gem 'ammeter'
  gem "test-unit", "~> 3.0"
end
