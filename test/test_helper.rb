ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use! [   # Minitest::Reporters::DefaultReporter.new(:color => true),
                             Minitest::Reporters::SpecReporter.new(:color => true),
                             #Minitest::Reporters::ProgressReporter.new(:color => true),
                             Minitest::Reporters::RubyMineReporter.new(:color => true)]



# MiniTest
class MiniTest::Unit::TestCase
  # include FactoryGirl::Syntax::Methods
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
