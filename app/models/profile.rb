class Profile < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :public_profile_url 
  before_validation :generate_public_profile_url
  
  def generate_public_profile_url
    self.public_profile_url = self.name.try(:parameterize) if self.public_profile_url.blank?
  end
end
