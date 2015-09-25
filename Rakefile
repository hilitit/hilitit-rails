# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new("shippable/testresults/")]

require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = false
  t.source_files = 'app/**/*.rb'
end
