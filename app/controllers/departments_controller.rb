class DepartmentsController < ApplicationController
  def new
    @department = Department.new
  end
  def create
    #render plain: params[:department].inspect
    @department = Department.new(department_params)
    if @department.save

      flash[:notice] "Department was successfully created."
      redirect_to department_path(@department)
    else
      render :new
    end
  end

def show
  @department = Department.find(params[:id])
end


  private
  def department_params
    params.require(:department).permit(:title)
  end
end
