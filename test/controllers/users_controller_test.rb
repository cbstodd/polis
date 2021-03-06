require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:charlotte)
    @another_user = users(:tommy)
    @admin_user = users(:colin)
  end

  test 'should redirect index to login_path when not logged in' do
    get :index
    assert_redirected_to login_url
  end

  test 'should get new and title' do
    get :new
    assert_response :success
    assert_select 'title', 'Sign up ~ Lowdown'
  end

  test 'should redirect edit to login_path when not logged in' do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update to login_path when not logged in' do
    patch :update, id: @user, user: { username: @user.username, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit to root_path when logged in as wrong user' do
    log_in_as(@another_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update to root_url when logged in as wrong user' do
    log_in_as(@another_user)
    patch :update, id: @user, user: { username: @user.username, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect destroy action when not logged in' do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@another_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

  test 'should redirect following when not logged in' do
    get :following, id: @user
    assert_redirected_to login_url
  end


  test 'should redirect followers when not logged in' do
    get :followers, id: @user
    assert_redirected_to login_url
  end

end
