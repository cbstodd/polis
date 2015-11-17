require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home page and title" do
    get :home
    assert_response :success
    assert_select "title", "Polis"
  end

  test "should get help page and title" do
    get :help
    assert_response :success
    assert_select "title", "Help ~ Polis"
  end

  test "should get about page and title" do
    get :about
    assert_response :success
    assert_select "title", "About ~ Polis"
  end

end
