class IssuePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    !user.has_role?(:manager)
  end

  def update?
    !user.has_role?(:manager)
  end

  def destroy?
    !user.has_role?(:manager)
  end

  def assign?
    return false unless user.has_role?(:manager)
    record.assignee.nil? || record.assignee == record.user
  end

  def set_state?
    user.has_role?(:manager)
  end
end
