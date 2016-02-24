require 'test_helper'

class EventpostTest < ActiveSupport::TestCase

  def setup
    @user = users(:tommy)
    @eventpost = @user.eventposts.build(title: 'Event title',
                                        content: 'Content text here',
                                        event_date: '2016-10-15')
  end

  # Asserts all database values are present with example above.
  test "should be valid" do
    assert @eventpost.valid?
  end

  test "user id should be preset" do
    @eventpost.user_id = nil
    assert_not @eventpost.valid?
  end

  test "title should be preset" do
    @eventpost.title = ''
    assert_not @eventpost.valid?
  end

  test "content should be preset" do
    @eventpost.content = ''
    assert_not @eventpost.valid?
  end

  test "title should not be too long" do
    @eventpost.title = 'a' * 81
    assert_not @eventpost.valid?
  end

  test "content should not be too long" do
    @eventpost.content = 'a' * 2001
    assert_not @eventpost.valid?
  end

  test "order should be more recent first" do
    assert_equal eventposts(:most_recent_post), Eventpost.last
  end


end
