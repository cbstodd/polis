class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user # in SessionHelper.rb
      if params[:session][:remember_me] == '1'
        remember user # Adds remember cookies
      else
        forget user
      end
      redirect_to user
    else
      flash.now[:warning] = "Invalid email/password combination"
      #.now prevents error message from rendering on another page.
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
