class EmployeesController < ApplicationController
  # before_action :employee, only: %i(update)
  #GET all
  def index
    @employees = Employee.all
    render json: serializer(@employees)
  end

  #GET filter by id
  def show
    render json: serializer(employee)
  end

  #POST create registration
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: serializer(@employee), status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  #PUT updated regristration
  def update
    if employee.update(employee_params)
      render json: serializer(employee)
    else
      render json: employee.errors, status: :unprocessable_entity
    end
  end

  #PUT updated status
  def update_enabled
    if employee.update(enable: !employee.enable)
      render json: serializer(employee)
    end
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

  def serializer(object)
    EmployeeSerializer.new(object).serializable_hash.to_json
  end

end
