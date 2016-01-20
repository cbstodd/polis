require 'test_helper'

class EventpostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:colin)
  end
  #
  test "eventpost interface on Event page" do
    log_in_as(@user)
    get events_path
    assert_template 'eventposts/index'
    assert_select 'h1', 'Event calendar'
  end

  test "eventpost interface on user page" do
    log_in_as(@user)
    get root_path
    assert_template root_path
    assert_select 'h3', 'Event feed'
    # Invalid submission
    assert_no_difference 'Eventpost.count' do
      post eventposts_path, eventpost: { title: "", event_date: "", content: "" }
    end

    assert_select 'div#error_explanation'
    # Valid submission
    title = "Title to event"
    date = "10-15-2016"
    content = "This eventpost really ties the room together"
    assert_difference 'Eventpost.count', 1 do
      post eventposts_path, eventpost: { title: title, event_date: date, content: content }
    end

    assert_redirected_to root_url
    follow_redirect!
    assert_match title, response.body
    assert_match date, response.body
    assert_match content, response.body
    # Delete a post.
    first_eventpost = @user.eventposts.paginate(page: 1).first
    assert_select 'a[href=?]', eventpost_path(first_eventpost), text: 'Delete post',
                  method: :delete
    assert_difference 'Eventpost.count', -1 do
      delete eventpost_path(first_eventpost)
    end

    # Visit a different user.
    get user_path(users(:charlotte))
    assert_select 'a', text: 'Delete post', count: 0

  end

end
