require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get user index page and title' do
    get :index
    assert_response :success
    assert_select 'title', 'Users ~ Polis'
  end

  test "should get new and title" do
    get :new
    assert_response :success
    assert_select 'title', 'Sign up ~ Polis'
  end

end
