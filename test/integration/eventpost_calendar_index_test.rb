require 'test_helper'

class EventpostCalendarIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tommy)
  end

  test "calendar has proper layout" do
    log_in_as(@user)
    get root_path
    # Valid submission
    title = "Title to event"
    content = "This eventpost really ties the room together"
    date = '2016-10-15' # Needs to be a the month you are testing.
    assert_difference 'Eventpost.count', 1 do
      post eventposts_path, eventpost: { title: title,
                                         content: content,
                                         event_date: date }
    end

    get events_path
    assert_template 'eventposts/index'
    assert_select 'title', 'Events ~ Polis'
    assert_select 'h1', 'Event calendar'
    assert_select 'table.table-default'
    assert_select 'tr' do # Need to include prev, next and same month.
      assert_select 'td.day', 35
    end



  end
end
