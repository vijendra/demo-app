require 'spec_helper'

describe "employment_details/new.html.haml" do
  before(:each) do
    assign(:employment_detail, stub_model(EmploymentDetail,
      :title => "MyString",
      :company => "MyString",
      :department => "MyString",
      :job_function => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new employment_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employment_details_path, :method => "post" do
      assert_select "input#employment_detail_title", :name => "employment_detail[title]"
      assert_select "input#employment_detail_company", :name => "employment_detail[company]"
      assert_select "select#employment_detail_department", :name => "employment_detail[department]" 
      assert_select "select#employment_detail_job_function", :name => "employment_detail[job_function]" 
      assert_select "select#employment_detail_from_date_1i", :name => "employment_detail[from_date(1i)]" 
      assert_select "select#employment_detail_from_date_2i", :name => "employment_detail[from_date(2i)]"
      assert_select "select#employment_detail_to_date_1i", :name => "employment_detail[to_date(1i)]" 
      assert_select "select#employment_detail_to_date_2i", :name => "employment_detail[to_date(2i)]" 
      assert_select "textarea#employment_detail_description", :name => "employment_detail[description]"
    end
  end
end
