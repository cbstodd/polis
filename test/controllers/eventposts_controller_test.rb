require 'test_helper'

class EventpostsControllerTest < ActionController::TestCase

  def setup
    @eventpost = eventposts(:concert)
  end

  test "should redirect create to login when not logged in" do
    assert_no_difference 'Eventpost.count' do
      post :create, eventpost: { title: "Eventpost title",
                                 content: "Eventpost content" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy to login when not logged in" do
    assert_no_difference 'Eventpost.count' do
      delete :destroy, id: @eventpost
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong eventpost" do
    log_in_as(users(:example_user))
    assert_no_difference 'Eventpost.count' do
      delete :destroy, id: eventposts(:damn_right)
    end
  end
end
