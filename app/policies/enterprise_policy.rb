class EnterprisePolicy < ApplicationPolicy
  def index?
    permissions.include? "view_enterprise"
  end

  def show?
    permissions.include? "view_enterprise"
  end

  def create?
    permissions.include? "create_enterprise"
  end

  def update?
    permissions.include? "update_enterprise"
  end

  def destroy?
    permissions.include? "destroy_enterprise" 
  end
end
