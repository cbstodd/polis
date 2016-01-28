class EventpostsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @eventposts = current_user.feed.paginate(page: params[:page])
    @user = User.find_by(params[:id])
    # @feed_items = current_user.feed.paginate(page: params[:page])
  end

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

  def show
    @eventpost = Eventpost.find(params[:id])
    # @eventpost = current_user.eventposts.find_by(id: params[:id])
    @user = User.find_by(params[:user_id])
  end

  def destroy
    @eventpost.destroy
    flash[:success] = "Event was deleted"
    redirect_to root_url || request.referrer
  end

  private

    def eventpost_params
      params.require(:eventpost).permit(:title, :content, :event_image, :event_date)
    end

    def correct_user
      @eventpost = current_user.eventposts.find_by(id: params[:id])
      redirect_to root_url if @eventpost.nil?
    end
end
