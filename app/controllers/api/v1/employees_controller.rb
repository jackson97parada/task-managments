module Api
  module V1
    class EmployeesController < ApplicationController
      before_action :employee, only: %i[show update destroy]
      before_action :authorize_employee, only: %i[show update destroy]

      #GET all
      def index
        @employees =
        FindEmployees.new.call(params).page(params[:page]).per(params[:per_page])
        authorize @employees
        render json: serializer(@employees)
      end

      #GET filter by id
      def show
        render json: serializer(@employee)
      end

      #POST create registration
      def create
        @employee = Employee.new(employee_params)
        if @employee.save
          authorize @employee
          render json: serializer(@employee), status: :created
        else
          render json: @employee.errors, status: :unprocessable_entity
        end
      end

      #PUT updated regristration
      def update
        if @employee.update(employee_params)
          render json: serializer(@employee)
        else
          render json: @employee.errors, status: :unprocessable_entity
        end
      end

      #DELETE delete a regristration
      def destroy
        @employee.destroy
      end

      private

      def employee
        @employee = Employee.find(params[:id])
      end

      #Function private
      def employee_params
        params.require(:employee).permit(:name, :last_name, :document, :mobile, :salary)
      end

      def serializer(object)
        EmployeeSerializer.new(object).serializable_hash.to_json
      end

      def authorize_employee
        authorize @employee
      end
    end
  end
end
