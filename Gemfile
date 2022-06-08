source "https://rubygems.org"

# Specify your gem"s dependencies in devise_ip_filter.gemspec
gemspec

env_rails_version = ENV.fetch("RAILS_VERSION", "default")

rails_version =
  case env_rails_version
  when "master"
    {github: "rails/rails"}
  when "default"
    "~> 7.0.3"
  else
    env_rails_version
  end

gem "rails", rails_version

if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.0.0")
  gem "net-smtp", require: false
end

# TODO: Implement a lighter-weight way of doing this
if Gem::Version.new(rail_version) >= Gem::Version.new("7.0")
  gem "sprockets-rails"
end

gem "rake", "~> 13.0"
gem "rubocop", "~> 1.21"

group :test, :development do
  gem "sqlite3"
end

group :test do
  gem "rack_session_access"
  gem "ammeter"
  gem "rspec", "~> 3.0"
  gem "rspec-rails"
  gem "test-unit", "~> 3.0"
end
