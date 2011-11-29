require 'spec_helper'

describe Profile do
  it "should generate public_profile_url from name" do
    @profile = Profile.create!(:name => 'Test A. User')
    @profile.public_profile_url.should eq('test-a-user')  
  end  
  
  it "should not be valid if name missing" do
     @profile = Profile.new(:name => '')
     @profile.should_not be_valid
  end
  
end
