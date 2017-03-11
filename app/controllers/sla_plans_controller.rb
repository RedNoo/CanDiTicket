class SlaPlansController < ApplicationController

  before_action :set_sla_plan, only:[:edit, :update, :show, :destroy]

  def index
    @sla_plans = SlaPlan.all
  end


  def new
    @sla_plan = SlaPlan.new
  end

  def edit
  end

  def create
    #render plain: params[:sla_plan].inspect
    @sla_plan = SlaPlan.new(sla_plan_params)
    if @sla_plan.save

      flash[:notice] = "SlaPlan was successfully created."
      redirect_to sla_plan_path(@sla_plan)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @sla_plan.destroy
    flash[:notice] = "SlaPlan was successfully deleted."
    redirect_to sla_plans_path
  end

def update
  if @sla_plan.update(sla_plan_params)
    flash[:notice] = "SlaPlan was successfully updated."
    redirect_to sla_plan_path(@sla_plan)
  else
    render :edit
  end
end


  private
  def set_sla_plan
    @sla_plan = SlaPlan.find(params[:id])
  end
  def sla_plan_params
    params.require(:sla_plan).permit(:title,:responsetime)
  end
end
