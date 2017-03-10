class MembersController < ApplicationController
  def index
    @members = Member.all
  end


  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
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
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "Member was successfully deleted."
    redirect_to members_path
  end

def update
  @member = Member.find(params[:id])
  if @member.update(member_params)
    flash[:notice] = "Member was successfully updated."
    redirect_to member_path(@member)
  else
    render :edit
  end
end


  private
  def member_params
    params.require(:member).permit(:email,:password)
  end
end
