require 'test_helper'

class UsersEventpostsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:colin)
  end

  test "should render user eventpost page" do
    log_in_as(@user)
    get root_path
    assert_template root_path
    assert_select 'body span.all-events-txt'
    title   = "Title to event"
    content = "This eventpost really ties the room together"
    date    = '2016-10-15'
    assert_difference 'Eventpost.count', 1 do
      post eventposts_path, eventpost: { title:      title,
                                         content:    content,
                                         event_date: date }
    end

    get events_user_path(@user)
    assert_select 'title', "#{@user.username}s events ~ Lowdown"
    assert_select 'h3', "#{@user.username}'s events"
    assert_select '.panel-title'
    assert_match @user.eventposts.count.to_s, response.body
  end

  test "user eventpost page should redirect to login_path when not signed in" do
    get root_url
    get events_user_path(@user)
    assert_redirected_to login_path
  end
end
