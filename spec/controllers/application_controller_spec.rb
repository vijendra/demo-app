describe ApplicationController do
 
  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "After sigin-in" do
    it "redirects to the dashboard page" do
      controller.after_sign_in_path_for(@user).should == dashboard_path
    end
  end

end
