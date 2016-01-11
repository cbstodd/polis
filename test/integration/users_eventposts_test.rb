require 'test_helper'

class UsersEventpostsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:colin)
  end

  test "should render user eventpost page" do
    log_in_as(@user)
    get events_user_path(@user)
    assert_select 'title', 'My events ~ Polis'
    assert_select 'h3', 'My events'
    # Valid submission
    title = "Title to event"
    content = "This eventpost really ties the room together"
    assert_difference 'Eventpost.count', 1 do
      post eventposts_path, eventpost: { title: title, content: content }
    end

    assert_redirected_to root_url
    follow_redirect!
    assert_match title, response.body
    assert_match content, response.body
    # Delete a post.
    first_eventpost = @user.eventposts.paginate(page: 1).first
    assert_select 'a[href=?]', eventpost_path(first_eventpost), text: 'Delete post',
                  method: :delete
    assert_difference 'Eventpost.count', -1 do
      delete eventpost_path(first_eventpost)
    end


  end

  test "user eventpost page should redirect to login_path when not signed in" do
    get root_url
    get events_user_path(@user)
    assert_redirected_to login_path
  end
end
