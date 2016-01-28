class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @eventpost = current_user.eventposts.build

      #Allows for similar search.
      query = params[:q].presence || '*'
      @feed_items = current_user.feed.paginate(page: params[:page]).search(query)
    end
  end

  def about
  end

  def help
  end

  def contact
  end

end
