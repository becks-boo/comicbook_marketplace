class UsersController < ApplicationController
  def dashboard
    @purchases = policy_scope(Purchase)
    authorize current_user
  end
end
