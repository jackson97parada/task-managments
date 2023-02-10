class TaskPolicy < ApplicationPolicy
  def index?
    permissions.include? "view_task"
  end

  def show?
    permissions.include? "view_task"
  end

  def create?
    permissions.include? "create_task"
  end

  def update?
    permissions.include? "update_task"
  end

  def update_enabled?
    permissions.include? "update_enabled_task"
  end

  def destroy?
    permissions.include? "destroy_task"
  end
end
