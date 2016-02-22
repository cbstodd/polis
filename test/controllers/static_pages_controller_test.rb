require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test 'should get home page and title' do
    get :home
    assert_response :success
    assert_select 'title', 'Lowdown'
  end

  test 'should get "help" page and title' do
    get :help
    assert_response :success
    assert_select 'title', 'Help ~ Lowdown'
  end

  test 'should get about page and title' do
    get :about
    assert_response :success
    assert_select 'title', 'About ~ Lowdown'
  end

  test 'sould get contact page and title' do
    get :contact
    assert_response :success
    assert_select 'title', 'Contact ~ Lowdown'
  end

end
