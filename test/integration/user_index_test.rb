require 'test_helper'

class UserIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:example_user)
    @admin_user = users(:admin_user)
  end

  test 'index including pagination' do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select '.badge'
  end

  test 'index admin page should have delete button on users' do
    log_in_as(@admin_user)
    get users_path
    assert_template 'users/index'
    assert_select '.btn-danger'
  end


end
