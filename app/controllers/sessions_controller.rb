class SessionsController < ApplicationController
  def new

  end
  def create
    member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      session[:member_id] = member.id
      flash[:success] = "You have successfully logged in"
      redirect_to member_path(member)
    else
      flash.now[:danger] = "There was a someting wrong with your login information"
      render 'new'

    end
  end
  def destroy
    session[:member_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
