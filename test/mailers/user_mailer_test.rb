require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:example_user)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Welcome to Polis",      mail.subject
    assert_equal [user.email],            mail.to
    assert_equal ["noreply@polis.com"],   mail.from
    assert_match user.username,           mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end


end
