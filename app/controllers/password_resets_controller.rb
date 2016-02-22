class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "If that email exists in our database you will receive an email with password reset instructions."
      redirect_to root_url
    else
      flash.now[:danger] = "That email address was not found"
      render :new
    end
  end

  def edit
  end

  def update
    if blank_password?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Your password has been reset"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Returns true if password & confirmation is blank.
    def blank_password?
      params[:user][:password].blank?
    end

    # Before filters
    def get_user
      @user = User.find_by_email(params[:email])
    end

    # Confirm a valid user.
    def valid_user
      unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
        redirect_to root_path
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:warning] = "The password reset has expired"
        redirect_to new_password_reset_path
      end
    end

end
