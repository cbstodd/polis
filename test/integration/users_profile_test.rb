require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  # Includes the Application helper to add (full_title) helper.

  def setup
    @user = users(:tommy)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.username)
    assert_select 'h1', text: "#{@user.username}'s profile"
    assert_select '.img-thumbnail'
    assert_match @user.eventposts.count.to_s, response.body
  end


end
