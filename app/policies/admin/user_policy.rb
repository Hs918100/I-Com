class Admin::UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def edit?
    user.admin?

  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
