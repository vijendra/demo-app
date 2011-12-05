Given /^I am in demo app home page$/ do
  visit '/'
end

Given /^I am a registered demo app member$/ do
  @user = Factory(:user)
end

Given /^I am a registered demo app member with a partially completed profile$/ do
  step %{I am a registered demo app member}
  @user.profile = Factory(:profile, :biography => "", :public_profile_url => "")
end

When /^I sign\-in successfully$/ do
  step %{I am in demo app home page}
  step %{I click on "Login" link}
  step %{I submit the sign\-in form with valid credentials}
  step %{I should be signed_in successfully}
end

Then /^I should see a link to "([^"]*)"$/ do |link|
  page.has_link?(link).should be_true
end

When /^I click on "([^"]*)" link$/ do |link|
  click_link link
end

Given /^I reach demo app sign\-up page$/ do
  step %{I should be in Sign\-up page}
end

Then /^I should be in Sign\-up page$/ do
  page.find('h2').should have_content("DemoApp Registration")
end

Given /^I submit the sign\-up form with valid relevant data$/ do
  fill_in('Email', :with => "test_user@example.org")
  fill_in('Password', :with => "secret")
  fill_in('Password confirmation', :with => "secret")
  fill_in('Name', :with => "Test User")
  click_button "Accept & create my account"
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content(content)
end
 
Then /^I should be signed\-up successfully$/ do
  step %{I should see "Welcome! You have signed up successfully."}
end

Given /^I submit the sign\-in form with valid credentials$/ do
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => "secret")
  click_button "Sign in"
end

Then /^I should be signed_in successfully$/ do
   step %{I should see "Signed in successfully."}
end
 
Then /^I should be in my profile page$/ do
  current_path.should == "/my_profile\/show"
  page.should have_css('h2', :text => 'Test User')
  page.should have_css('h2', :text => 'Biography')
  page.should have_css('h2', :text => 'Employment')
  page.should have_css('h2', :text => 'Education')
  page.should have_css('h2', :text => 'Expertise')
end 

When /^I am in my profile page$/ do
  step %{I click on "Profile" link}
  step %{I should be in my profile page}
end

Then /^I should see a link to edit my Personal details$/ do
  page.find(:xpath, "//a[@href=\'#{edit_my_profile_path}\']") 
end

Then /^I should see a link to edit my Biography details$/ do
  page.find(:xpath, "//a[@href=\'#{edit_my_profile_path}\']") 
end

Then /^I should see edit profile page by clicking on link to edit Personal details$/ do
  find(:xpath, "//a[@href=\'#{edit_my_profile_path}\']").click 
  current_path.should == "/my_profile\/edit"
  page.should have_selector("form[action='/my_profile\/update']") 
end

Then /^I should see edit profile page by clicking on link to edit Biography details$/ do
  page.find(:xpath, "//a[@href=\'#{edit_my_profile_path}\']").click 
  current_path.should == "/my_profile\/edit"
  page.should have_selector("form[action='/my_profile\/update']") 
end

Then /^I fill in relevant personal data and save$/ do
  fill_in('Name', :with => "Test User1")
  click_button "Update my profile"
end

Then /^I should see updated personal data in my profile page$/ do
  page.should have_css('h2', :text => 'Test User1')
end

Then /^I fill in relevant biography data and save$/ do
  fill_in('Biography', :with => "Some thing really cool")
  click_button "Update my profile"
end

Then /^I should see updated biography data in my profile page$/ do
  page.should have_content('Some thing really cool')
end

Then /^I should see a link to add new employment details$/ do
  have_link(:href => "#{new_employment_detail_path}")
end

When /^I click on add employment link$/ do
  find(:xpath, "//a[@href=\'#{new_employment_detail_path}\']").click
end

Then /^I should see a form to enter employment details$/ do
  page.should have_css('h2', :text => 'Add Employment detail')
  current_path.should == "/employment_details\/new"
  page.should have_selector("form", :method => 'post', :action => '/employment_details') 
end

Then /^I enter relevant employment data and save$/ do
  fill_in('Title', :with => "Manager at Isiri Technologies")
  fill_in('Company', :with => "ISIRI Technologies Pvt LTD")
  select( "Information Technology", :from => 'Department')
  select( "Manager", :from => 'Job function')
  select_month_year('From date', :with => '2009-04-05')
  select_month_year('To date', :with => '2010-04-05')
  click_button "Save"
end

Then /^I should see the added employment data in my profile page$/ do
  page.should have_css('h4', :text => 'ISIRI Technologies Pvt LTD')
  page.should have_content( 'Manager at Isiri Technologies')
  page.should have_content( 'April 2009 - April 2010')
end
 
Then /^I have added employment detail$/ do
  @employment_detail = @user.employment_details.first
end
 
Then /^I have added multiple employment details$/ do
  @employment_details = @user.employment_details
end
 
Then /^I should see a link to edit each employment detail$/ do
  @employment_details.each do |employment_detail|
    have_link(:href => "#{edit_employment_detail_path(employment_detail)}")
  end  
end

Given /^I am in the edit employment detail form by clicking the edit link$/ do
  page.find(:xpath, "//a[@href=\'#{edit_employment_detail_path(@employment_detail)}\']").click
  page.should have_css('h2', :text => 'Editing employment detail')
end
 
When /^I update the relevant employment data and save$/ do
  fill_in('Title', :with => "CEO at Isiri Technologies")
  select( "CEO/President", :from => 'Job function')
  select_month_year('From date', :with => '2010-04-05')
  select_month_year('To date', :with => '2011-04-05')
  click_button "Save"
end

Then /^I should see updated employment data$/ do
  page.should have_content('CEO at Isiri Technologies')
  page.should have_content('April 2010 - April 2011')
end

When /^I update the relevant employment data but cancel saving$/ do
  fill_in('Title', :with => "CEO at Isiri Technologies")
  click_link_or_button('Cancel')
end

Then /^I should see unchanged employment data$/ do
  page.should have_content('Manager at Isiri Technologies')
end

Then /^I should see a link to delete currently opened employment data$/ do
  have_link('Delete', :method => :delete, :href => "#{employment_detail_path(@employment_detail)}")
end

Then /^clicking on delete link removes the employment detail$/ do
  page.should_not have_content('Manager at Isiri Technologies')
end


#overriding select_date as there is no option to exclude date 
def select_month_year(field, options)
  date = Date.parse(options[:with])
  base_dom_id = get_base_dom_id_from_label_tag(field)

  find(:xpath, ".//select[@id='#{base_dom_id}_1i']").select(date.year.to_s)
  find(:xpath, ".//select[@id='#{base_dom_id}_2i']").select(I18n.l date, :format => '%B')
end 
 
