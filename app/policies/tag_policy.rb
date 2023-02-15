class TagPolicy < ApplicationPolicy
  def index?
    permissions.include? "view_tag"
  end

  def show?
    permissions.include? "view_tag"
  end

  def create?
    permissions.include? "create_tag"
  end

  def update?
    permissions.include? "update_tag"
  end

  def destroy?
    permissions.include? "destroy_tag"
  end
end
