Factory.define(:user) do |u|
  u.email "test_user@example.org"
  u.password "secret"
  u.association :profile
  u.id '100'
  u.employment_details {|u| [u.association(:test_user_employment_detail1), u.association(:test_user_employment_detail2)]}
end

Factory.define(:profile) do |p|
  p.name "Test User"
  p.biography "Cool Stuff"
  p.public_profile_url "test_user"
end

Factory.define(:test_user_employment_detail1, :class => :employment_detail) do |e|
   e.title "Manager at Isiri Technologies"
   e.company "Isiri Technologies Pvt Ltd"
   e.department "Information Technology"
   e.job_function "Manager"
   e.from_date  "2009-04-05"
   e.to_date "2010-04-05"
   e.description "Test description"
end

Factory.define(:test_user_employment_detail2, :class => :employment_detail) do |e|
   e.title "CEO at Isiri Technologies"
   e.company "Isiri Technologies Pvt Ltd"
   e.department "Information Technology"
   e.job_function "CEO/President"
   e.from_date  "2010-04-05"
   e.to_date "2011-04-05"
   e.description "Test description"
end
