class EmployeesController < ApplicationController
  
  #GET all
  def index
    @employees = Employee.all
    render json: @employees
  end

  #POST filter by id
  def show
    render json: employee
  end

  #POST create registration
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee
    end
  end

  #PUT updated regristration
  def update
    if employee.update(employee_params)
      render json: employee
    end
  end

  #PUT updated status
  def update_enabled
    employee.update(enable: !employee.enable)
    render json: employee
  end

  #DELETE delete a regristration
  def destroy
    employee.destroy
  end

  private

  #Function private
  def employee_params
    params.require(:employee).permit(:name, :last_name, :document, :mobile, :salary)
  end

  #Function private
  def employee
    Employee.find(params[:id])
  end
end
