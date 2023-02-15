class EmployeePolicy < ApplicationPolicy
  def index?
    permissions.include? "view_employee"
  end

  def show?
    permissions.include? "view_employee"
  end

  def create?
    permissions.include? "create_employee"
  end

  def update?
    permissions.include? "update_employee"
  end

  def destroy?
    permissions.include? "destroy_employee"
  end
end
