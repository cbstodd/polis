require 'test_helper'

class UserIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:exampleuser)
  end

  test 'index including pagination' do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select '.users-link'
    # User.paginate(page: 1).each do |user|
    #   assert_select 'a[href=?]', user_path(user), user.username
    # end
  end
end
