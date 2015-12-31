require 'test_helper'

class EventpostIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:admin_user)
  end

  test "events index page" do
    # log_in_as(@user)
    # get users_path(@user)
    # get '/eventposts'

  end
end
