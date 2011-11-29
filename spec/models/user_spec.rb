require 'spec_helper'

describe User do
  it "should create the corresponding profile while creating a new user" do
    expect { 
             Factory(:user, :profile_attributes => Factory.attributes_for(:profile)) 
           }.to change(Profile, :count).by(1) 
  end
  
  describe 'should allow to mass assign' do 
    it "email field" do
      @user = Factory(:user)
      @user.email = 'test_user1@example.com'
      @user.save
      @user.email.should  eq('test_user1@example.com') 
    end  
    
    it "profile_attributes" do
       @user = Factory(:user, :profile_attributes => {:name => 'Test User1'})
       @user.profile.name.should eq('Test User1')
    end  

  end  
end
