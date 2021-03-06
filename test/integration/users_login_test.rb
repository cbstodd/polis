require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tommy)
  end

  test 'login with invalid information' do
    get login_path #Goes to session/new.
    assert_template 'sessions/new' #Asserts that session/new template is rendered.
    post login_path, session: { email: '', password: '' } #Fill form with failing info.
    assert_template 'sessions/new' # Asserts controller behavior to render sessions/new.
    assert_not flash.empty? # Says error_message/flash should be thrown.

    get root_path #Get new root path.
    assert flash.empty? #Makes sure error/flash message is not thrown on another page.
  end

  test 'login with valid information followed by logout' do
    get login_path

    #log in process.
    post login_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path
    assert_select 'a[href=?]', user_path(@user)

    #log out process.
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url

    # Simulate a user clicking logout in a second window
    delete logout_path

    #Continue log out process.
    follow_redirect!
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', logout_path,      count: 0
    assert_select 'a[href=?]', user_path(@user), count: 0
  end

  test 'should have link to the signup page' do
    get login_path
    assert_select 'span a[href=?]', signup_path
  end

  test 'login with remembering' do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test 'login without remembering' do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end





end
