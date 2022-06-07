begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require "bundler/gem_tasks"
require_relative "spec/rails_app/config/application"

APP_RAKEFILE = File.expand_path("../spec/rails_app/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

require 'rspec/core/rake_task'

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec => 'app:db:test:prepare')

task :default => :spec

# To test against a specific version of Rails
# export RAILS_VERSION=3.2.0; bundle update; rake
