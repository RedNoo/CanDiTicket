class DepartmentsController < ApplicationController

  before_action :set_department, only:[:edit, :update, :show, :destroy]

  def index
    @departments = Department.all
  end


  def new
    @department = Department.new
  end

  def edit
  end

  def create
    #render plain: params[:department].inspect
    @department = Department.new(department_params)
    if @department.save

      flash[:success] = "Department was successfully created."
      redirect_to department_path(@department)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @department.destroy
    flash[:danger] = "Department was successfully deleted."
    redirect_to departments_path
  end

def update
  if @department.update(department_params)
    flash[:success] = "Department was successfully updated."
    redirect_to department_path(@department)
  else
    render :edit
  end
end


  private
  def set_department
    @department = Department.find(params[:id])
  end
  def department_params
    params.require(:department).permit(:title)
  end
end
