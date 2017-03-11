class PrioritiesController < ApplicationController

before_action :set_priority, only:[:edit, :update, :show, :destroy]

  def index
    @priorities = Priority.all
  end


  def new
    @priority = Priority.new
  end

  def edit
  end

  def create
    #render plain: params[:priority].inspect
    @priority = Priority.new(priority_params)
    if @priority.save

      flash[:notice] = "Priority was successfully created."
      redirect_to priority_path(@priority)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @priority.destroy
    flash[:notice] = "Priority was successfully deleted."
    redirect_to priorities_path
  end

def update
  if @priority.update(priority_params)
    flash[:notice] = "Priority was successfully updated."
    redirect_to priority_path(@priority)
  else
    render :edit
  end
end


  private
  def set_priority
    @priority = Priority.find(params[:id])
  end
  def priority_params
    params.require(:priority).permit(:title)
  end
end
