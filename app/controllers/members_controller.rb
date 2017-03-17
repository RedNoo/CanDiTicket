class MembersController < ApplicationController

  before_action :set_member, only:[:edit, :update, :show, :destroy]

  def index
    @members = Member.paginate(page: params[:page], per_page: 2)
  end


  def new
    @member = Member.new
  end

  def edit
  end

  def create
    #render plain: params[:member].inspect
    @member = Member.new(member_params)
    if @member.save

      flash[:notice] = "Member was successfully created."
      redirect_to member_path(@member)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @member.destroy
    flash[:notice] = "Member was successfully deleted."
    redirect_to members_path
  end

def update
  if @member.update(member_params)
    flash[:notice] = "Member was successfully updated."
    redirect_to member_path(@member)
  else
    render :edit
  end
end


  private
  def set_member
      @member = Member.find(params[:id])
  end
  def member_params
    params.require(:member).permit(:email,:password)
  end
end
