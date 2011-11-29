require 'forwardable'

class UserPresenter
  extend Forwardable
  extend ActiveSupport::Memoizable
   
  def initialize(user)
    @user = user 
  end
 
  def name
    @user.name
  end
  
  def biography
    @user.biography
  end
  
  def employments
    @employments = @user.employments
  end
  memoize :employments
end
