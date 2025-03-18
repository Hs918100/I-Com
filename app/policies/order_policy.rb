class OrderPolicy < ApplicationPolicy
  def new?
    user.customer?
  end

 def index?
  user.customer?
 end

 def show?
  user.customer?
 end

 def create?
  user.customer?
 end

 def destroy?
  user.customer?
 end
end
