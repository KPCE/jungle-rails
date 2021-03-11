class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # include UserHelper
  def self.authenticate_with_credentials(email, password)
    # if email.blank? || name.blank?
    #   nil
    # else 
    
      #if email and password are authenticated, retunr instance variable, else nil
      user = User.find_by_email(email.strip.downcase)
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(password)
        user
        # if User.exists?(email: email)
        #   nil
        # else
        #   @user
        # end
      else
        
        nil
      end
    # end
  end
  
end
