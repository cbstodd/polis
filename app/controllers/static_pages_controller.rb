class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @eventpost = current_user.eventposts.build
      #Allows for similar search.
      #Only shows future eventposts.
      # query = params[:q].presence || '*'
      @feed_items =  current_user.feed.where('event_date >= ?', Date.today - 1).order(:event_date).paginate(page: params[:page])

    end
  end

  def about
  end

  def help
  end

  def contact
  end

end
