require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new session/login page and title" do
    get :new
    assert_response :success
    assert_select 'title', 'Log in ~ Polis'
  end

end
