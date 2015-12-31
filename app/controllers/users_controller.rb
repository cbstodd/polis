class UsersController < ApplicationController
  # @user = User.find(params[:id]) Not needed in Edit and Update bc
  #  of the before_actions below.
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 25)
  end

  def show
    @user = User.find(params[:id])
    @eventposts = @user.eventposts.paginate(page: params[:page], per_page: 15)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Thank you for joining! Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile was updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "The user \"#{@user.username}\" has been deleted"
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    #Confirms the correct_user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    #Confirms admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
