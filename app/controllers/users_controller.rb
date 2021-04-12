class UsersController < ApplicationController
  def dashboard
    authorize current_user
  end
end
