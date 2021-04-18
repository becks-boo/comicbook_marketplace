class PurchasePolicy < ApplicationPolicy
  attr_reader :purchase

  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end

  def show?
    user_is_owner_of_record?
  end
end
