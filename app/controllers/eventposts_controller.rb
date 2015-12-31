class EventpostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @eventpost = current_user.eventposts.build(eventpost_params)
    if @eventpost.save
      flash[:success] = "Your event has been created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end

  end

  def destroy
    @eventpost.destroy
    flash[:success] = "Event was deleted"
    redirect_to request.referrer || root_url
  end

  private

    def eventpost_params
      params.require(:eventpost).permit(:title, :content)
    end

    def correct_user
      @eventpost = current_user.eventposts.find_by(id: params[:id])
      redirect_to root_url if @eventpost.nil?
    end
end
