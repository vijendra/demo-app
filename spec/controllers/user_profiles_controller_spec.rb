require 'spec_helper'

describe UserProfilesController do
  describe 'user logged in' do
    before do
      user = Factory(:user)
      @profile = user.profile
      controller.stub(:authenticate_user!)
      controller.stub(:current_user).and_return(user)
    end
  
    def valid_attributes
      {:name => "Test user", :public_profile_url => "test_user" }
    end
  
    describe "GET edit" do
      it "assigns the requested employment_detail as @employment_detail" do
        get :edit, :id => @profile.id
        assigns(:profile).should eq(@profile)
      end
    end
  
    describe "PUT update" do
      describe "with valid params" do
        it "updates the current user profile" do
          Profile.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => @profile.id, :user_profile => {'these' => 'params'}
        end
 
        it "redirects to the current user profile after updating" do
          put :update, :id => @profile.id, :user_profile => valid_attributes
          response.should redirect_to(show_my_profile_path)
        end
      end

      describe "with invalid params" do
        it "re-renders the 'edit' template" do
          Profile.any_instance.stub(:save).and_return(false)
          put :update, :id => @profile.id, :employment_detail => {}
          response.should render_template("edit")
        end
      end
    end
  end
  
  describe 'user not logged in' do
     before do
      controller.stub!(:logged_in?).and_return(false)
    end
    
    it 'should redirect to the login page' do
      get :edit, :id => Factory(:profile).id
      response.should redirect_to(new_user_session_path)
    end
  end
    
end
