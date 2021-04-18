class ComicBookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    user_is_owner_of_record?
  end

  def update?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end
end
