class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @eventpost = current_user.eventposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def help
  end

  def contact
  end

end
