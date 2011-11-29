require 'spec_helper'

describe UsersController do
  describe 'user logged in' do
    
		before do
		  @user = Factory(:user)
		  controller.stub(:authenticate_user!)
		  controller.stub(:current_user).and_return(@user)
		end
  
		describe "GET 'show'" do
		  it "returns http success" do
		    get 'show'
		    response.should be_success
		  end
	 
		  it "assigns the related variables" do
		    get :show 
		    assigns(:user).should eq(@user)
		    assigns(:employments).should eq(@user.employment_details)
		  end
		end
  end
  describe 'user not logged in' do
     before do
      controller.stub!(:logged_in?).and_return(false)
    end
    
    it 'should redirect to the login page' do
      get :show 
      response.should redirect_to(new_user_session_path)
    end
  end
end
