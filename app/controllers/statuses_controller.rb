class StatusesController < ApplicationController

  before_action :set_status, only:[:edit, :update, :show, :destroy]


  def index
    @statuses = Status.all
  end


  def new
    @status = Status.new
  end

  def edit
  end

  def create
    #render plain: params[:status].inspect
    @status = Status.new(status_params)
    if @status.save

      flash[:notice] = "Status was successfully created."
      redirect_to status_path(@status)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @status.destroy
    flash[:notice] = "Status was successfully deleted."
    redirect_to statuses_path
  end

def update
  if @status.update(status_params)
    flash[:notice] = "Status was successfully updated."
    redirect_to status_path(@status)
  else
    render :edit
  end
end


  private
  def set_status
  @status = Status.find(params[:id])
  end
  def status_params
    params.require(:status).permit(:title)
  end
end
