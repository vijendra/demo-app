require 'spec_helper'

describe EmploymentDetail do
  before(:each) do
    @attr = { 
      :title => "Example title",
      :company => 'Isiri Technologies',
      :department => "IT",
      :job_function => "Manager"
    }
  end
  
  it "should not be valid if title missing" do
     employment_detail = EmploymentDetail.new(@attr.merge(:title => "") )
     employment_detail.should_not be_valid
  end
  
   it "should not be valid if company missing" do
     employment_detail = EmploymentDetail.new(@attr.merge(:company => ""))
     employment_detail.should_not be_valid
  end
  
  it "should not be valid if department missing" do
     employment_detail = EmploymentDetail.new(@attr.merge(:department => ""))
     employment_detail.should_not be_valid
  end
  
  it "should not be valid if job_function missing" do
     employment_detail = EmploymentDetail.new(@attr.merge(:job_function => ""))
     employment_detail.should_not be_valid
  end
end
