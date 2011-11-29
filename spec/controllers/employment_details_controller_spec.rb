require 'spec_helper'

describe EmploymentDetailsController do
  describe 'user logged in' do 
		before do
		  @user = Factory(:user)
		  controller.stub(:authenticate_user!)
		  controller.stub(:current_user).and_return(@user)
		end
  
		def valid_attributes
		  {:title => "Manager at Isiri Technologies", :company => "ISIRI Technologies Pvt LTD", :department => "Information Technology", :job_function => "Manager", :from_date => '2009-04-05', :to_date => '2010-04-05'}
		end
		    
		describe "GET new" do
		  it "assigns a new employment_detail as @employment_detail" do
		    get :new
		    assigns(:employment_detail).should be_a_new(EmploymentDetail)
		  end
		end

		describe "GET edit" do
		  it "assigns the requested employment_detail as @employment_detail" do
		    employment_detail = @user.employment_details.create! valid_attributes
		    get :edit, :id => employment_detail.id
		    assigns(:employment_detail).should eq(employment_detail)
		  end
		end

		describe "POST create" do
		  describe "with valid params" do
		    it "creates a new EmploymentDetail" do
		      expect {
		        post :create, :employment_detail => valid_attributes
		      }.to change(EmploymentDetail, :count).by(1)
		    end

		    it "assigns a newly created employment detail as @employment_detail" do
		      post :create, :employment_detail => valid_attributes
		      assigns(:employment_detail).should be_a(EmploymentDetail)
		      assigns(:employment_detail).should be_persisted
		    end

		    it "redirects to the current user profile after creating employment detail" do
		      post :create, :employment_detail => valid_attributes
		      response.should redirect_to(show_my_profile_path)
		    end
		    
		    it "newly created employment detail will be current user's employment detail" do
		      post :create, :employment_detail => valid_attributes
		      assigns(:employment_detail).user == @user 
		    end
		  end

		  describe "with invalid params" do
		    it "assigns a newly created but unsaved employment_detail as @employment_detail" do
		      EmploymentDetail.any_instance.stub(:save).and_return(false)
		      post :create, :employment_detail => {}
		      assigns(:employment_detail).should be_a_new(EmploymentDetail)
		    end

		    it "re-renders the 'new' template" do
		      EmploymentDetail.any_instance.stub(:save).and_return(false)
		      post :create, :employment_detail => {}
		      response.should render_template("new")
		    end
		  end
		end

		describe "PUT update" do
		  describe "with valid params" do
		    it "updates the requested employment_detail" do
		      employment_detail = @user.employment_details.create! valid_attributes
		      EmploymentDetail.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
		      put :update, :id => employment_detail.id, :employment_detail => {'these' => 'params'}
		    end

		    it "assigns the requested employment_detail as @employment_detail" do
		      employment_detail = @user.employment_details.create! valid_attributes
		      put :update, :id => employment_detail.id, :employment_detail => valid_attributes
		      assigns(:employment_detail).should eq(employment_detail)
		    end

		    it "redirects to the current user profile after updating the employment detail" do
		      employment_detail = @user.employment_details.create! valid_attributes
		      put :update, :id => employment_detail.id, :employment_detail => valid_attributes
		      response.should redirect_to(show_my_profile_path)
		    end
		  end

		  describe "with invalid params" do
		    it "assigns the employment_detail as @employment_detail" do
		      employment_detail = @user.employment_details.create! valid_attributes
		      EmploymentDetail.any_instance.stub(:save).and_return(false)
		      put :update, :id => employment_detail.id, :employment_detail => {}
		      assigns(:employment_detail).should eq(employment_detail)
		    end

		    it "re-renders the 'edit' template" do
		      employment_detail = @user.employment_details.create! valid_attributes
		      EmploymentDetail.any_instance.stub(:save).and_return(false)
		      put :update, :id => employment_detail.id, :employment_detail => {}
		      response.should render_template("edit")
		    end
		  end
		end

		describe "DELETE destroy" do
		  it "destroys the requested employment_detail" do
		    employment_detail = @user.employment_details.create! valid_attributes
		    expect {
		      delete :destroy, :id => employment_detail.id
		    }.to change(EmploymentDetail, :count).by(-1)
		  end

		  it "redirects to the employment_details list" do
		    employment_detail = @user.employment_details.create! valid_attributes
		    delete :destroy, :id => employment_detail.id
		    response.should redirect_to(show_my_profile_path)
		  end
		end
  end
  
  describe 'user not logged in' do
    before do
      controller.stub!(:logged_in?).and_return(false)
    end
    
    it 'should not allow to edit employment detail' do
      get :edit, :id => Factory(:test_user_employment_detail1).id
      response.should redirect_to(new_user_session_path)
    end
    
    it 'should not allow creating new employment detail ' do
      get :new
      response.should redirect_to(new_user_session_path)
    end
  end
end
