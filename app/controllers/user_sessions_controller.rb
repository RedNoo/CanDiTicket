class UserSessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:user_session][:email].downcase)
    if user && user.authenticate(params[:user_session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was a someting wrong with your login information"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
