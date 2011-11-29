class EmploymentDetailsController < ApplicationController
 
  def new
    @employment_detail = EmploymentDetail.new
  end

  def edit
    @employment_detail = current_user.employment_details.find(params[:id])
  end


  def create
    @employment_detail = current_user.employment_details.new(params[:employment_detail])
    if @employment_detail.save
      redirect_to show_my_profile_path, notice: 'Employment detail was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @employment_detail = current_user.employment_details.find(params[:id])

    if @employment_detail.update_attributes(params[:employment_detail])
      redirect_to show_my_profile_path, notice: 'Employment detail was successfully updated.' 
    else
      render action: "edit"
    end
  end


  def destroy
    @employment_detail = current_user.employment_details.find(params[:id])
    @employment_detail.destroy
    redirect_to show_my_profile_path
  end
end
