class UserProfilesController < ApplicationController
  def edit
    @profile = current_user.profile
  end
  
  def update
    profile = current_user.profile
    if profile.update_attributes(params[:user_profile])
      redirect_to show_my_profile_path
    else
      render :edit
    end
  end
end
