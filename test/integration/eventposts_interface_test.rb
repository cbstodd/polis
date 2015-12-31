require 'test_helper'

class EventpostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin_user)
  end

  test "eventpost interface" do
    log_in_as(@user)
    get root_path
    assert_template root_path
    assert_select 'h3', 'Event feed'
    # Invalid submission
    assert_no_difference 'Eventpost.count' do
      post eventposts_path, eventpost: { title: "", content: "" }
    end

    assert_select 'div#error_explanation'
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

    # Visit a different user.
    get user_path(users(:example_user_two))
    assert_select 'a', text: 'Delete post', count: 0

  end

end
