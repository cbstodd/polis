require 'test_helper'

class ShowEventpostTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:colin)
  end

  # test "should render show event page" do
  #   log_in_as(@user)
    # get root_url
    # #Creates a post at root_url to be displayed.
    # title = "Title to event"
    # content = "This eventpost really ties the room together"
    # assert_difference 'Eventpost.count', 1 do
    #   post eventposts_path, eventpost: { title: title, content: content }
    # end

    # After post created, go to event show path to see event.
    # get '/eventposts/:id'
    # assert_template 'eventposts/show'
    # assert_select 'title', 'Event ~ Polis'
    # assert_select 'h3', 'Event'
    # assert_select '.panel-title'
    # assert_match @user.eventposts.count.to_s, response.body
  # end
end
