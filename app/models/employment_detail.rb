class EmploymentDetail < ActiveRecord::Base
  validates_presence_of :title, :company, :department, :job_function
  belongs_to :user
end
