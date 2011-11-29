class UsersController < ApplicationController
  def show
    @user = current_user
    @employments = current_user.employment_details
  end

end
