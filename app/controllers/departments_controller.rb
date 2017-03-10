class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end


  def new
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end

  def create
    #render plain: params[:department].inspect
    @department = Department.new(department_params)
    if @department.save

      flash[:notice] = "Department was successfully created."
      redirect_to department_path(@department)
    else
      render :new
    end
  end

  def show
    @department = Department.find(params[:id])
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    flash[:notice] = "Department was successfully deleted."
    redirect_to departments_path
  end

def update
  @department = Department.find(params[:id])
  if @department.update(department_params)
    flash[:notice] = "Department was successfully updated."
    redirect_to department_path(@department)
  else
    render :edit
  end
end


  private
  def department_params
    params.require(:department).permit(:title)
  end
end
