ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use! [   #Minitest::Reporters::DefaultReporter.new(:color => true),
                             # Minitest::Reporters::SpecReporter.new(:color => true),
                             Minitest::Reporters::ProgressReporter.new(:color => true),
                             Minitest::Reporters::RubyMineReporter.new(:color => true)]



# MiniTest
class MiniTest::Unit::TestCase
  # include FactoryGirl::Syntax::Methods
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def is_logged_in?
    !session[:user_id].nil?
  end

  # logs in a test user.
  def log_in_as(user, options = {})
    password = options[:password]       || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email: user.email,
                                  password: password,
                                  remember_me: remember_me
                                }
    else
      session[:user_id] = user.id
    end
  end


  # PRIVATE
  private

    # Returns true inside integration test.
    def integration_test?
      defined?(post_via_redirect)

    end
end
