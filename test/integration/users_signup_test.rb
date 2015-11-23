require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, user: { username: '',
                             email: 'invalid@user.com',
                             password: 'invalid',
                             password_confirmation: 'notvalid'
                            }
    end
      assert_template 'users/new'
  end

  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
    post_via_redirect users_path, user: { username: 'validexample',
                                          email: 'valid@example.com',
                                          password: 'validPass',
                                          password_confirmation: 'validPass'
                                        }
    end
      assert_template 'users/show'
      assert is_logged_in?
  end

  test 'should have a link to log in' do
    get signup_path
    assert_select 'p a[href=?]', login_path
  end
end
