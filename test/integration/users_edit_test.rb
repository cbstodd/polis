require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:example_user)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    patch user_path(@user), user: { username: '',
                                    email: 'invalid@user.com',
                                    password: 'invalid',
                                    password_confirmation: 'notvalid' }
    assert_template 'users/edit'
  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    username = 'validexample' #Valid username variable
    email = 'valid@example.com' #Valid email variable
    patch user_path(@user), user: { username: username,
                                    email: email,
                                    password: '',
                                    password_confirmation: '' }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload # Reloads user into test database.
    assert_equal @user.username, username #Asserts username is correct.
    assert_equal @user.email, email #Asserts new email is correct
  end
end
