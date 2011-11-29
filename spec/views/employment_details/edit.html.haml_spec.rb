require 'spec_helper'

describe "employment_details/edit.html.haml" do
  before(:each) do
    user = Factory(:user)
    @employment_detail = user.employment_details.first
    assign(:employment_detail, @employment_detail )
    controller.stub(:authenticate_user!)
    controller.stub(:current_user).and_return(user)
  end

  it "renders the edit employment_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employment_details_path(@employment_detail), :method => "post" do
      assert_select "input#employment_detail_title", :name => "employment_detail[title]", :value => @employment_detail.title
      assert_select "input#employment_detail_company", :name => "employment_detail[company]", :value => @employment_detail.company
      assert_select "select#employment_detail_department", :name => "employment_detail[department]", :value => @employment_detail.department
      assert_select "select#employment_detail_job_function", :name => "employment_detail[job_function]", :value => @employment_detail.job_function
      assert_select "select#employment_detail_from_date_1i", :name => "employment_detail[from_date(1i)]", :value => @employment_detail.from_date.year
      assert_select "select#employment_detail_from_date_2i", :name => "employment_detail[from_date(2i)]", :value => @employment_detail.from_date.month
      
      assert_select "select#employment_detail_to_date_1i", :name => "employment_detail[to_date(1i)]", :value => @employment_detail.to_date.year
      assert_select "select#employment_detail_to_date_2i", :name => "employment_detail[to_date(2i)]", :value => @employment_detail.to_date.month
      
      assert_select "textarea#employment_detail_description", :name => "employment_detail[description]", :value => @employment_detail.description
    end
  end
end
