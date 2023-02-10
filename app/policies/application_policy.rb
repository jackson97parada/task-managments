class ApplicationPolicy
  attr_reader :user, :permissions, :record

  def initialize(user,
    permissions = user.roles.flat_map(&:permission_roles).map(&:permission),
    record)
    @user = user
    @permissions = permissions
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
