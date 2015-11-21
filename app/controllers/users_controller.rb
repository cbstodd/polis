class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Polis! Post a event to let others know whats going on."
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
