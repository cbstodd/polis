require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end


  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, user: { username: '',
                             email: 'invalid@user.com',
                             password:              'invalid',
                             password_confirmation: 'notvalid' }
    end
      assert_template 'users/new'
  end

  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
    post users_path, user: { username: 'validexample',
                             email: 'valid@example.com',
                             password:              'validPass',
                             password_confirmation: 'validPass' }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation.
    log_in_as(user)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token")
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  test 'should have a link to log in' do
    get signup_path
    assert_select 'span a[href=?]', login_path
  end
end
