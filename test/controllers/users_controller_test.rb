require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:exampleuser)
    @another_user = users(:exampleuser_two)
  end

  test 'should redirect index to login_path when not logged in' do
    get :index
    assert_redirected_to login_url
  end

  test "should get new and title" do
    get :new
    assert_response :success
    assert_select 'title', 'Sign up ~ Polis'
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

end
