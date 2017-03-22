class UsersController < ApplicationController

  before_action :set_user, only:[:edit, :update, :show, :destroy]
  before_action :require_adminuser, only:[:new,:create, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end


  def new
    @user = User.new
  end

  def edit
  end

  def create
    #render plain: params[:user].inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome toda CanDiTicket"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:notice] = "User was successfully deleted."
    redirect_to users_path
  end

def update
  if @user.update(user_params)
    flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user)
  else
    render :edit
  end
end


  private
  def set_user
      @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:email,:password, :full_name)
  end

  def require_adminuser
    if !current_user.admin?
      flash[:danger] = "You need admin permissions"
      redirect_to root_path
    end
  end
end
