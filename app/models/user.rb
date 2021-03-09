class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true
  validates :name, presence: true

  def authenticate_with_credentials(email, password)
    # if email.blank? || name.blank?
    #   nil
    # else 
    
      #if email and password are authenticated, retunr instance variable, else nil
      user = User.find_by_email(email.strip.downcase)
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(password)
        if User.exists?(email: params[:user][:email])
          nil
        else
          @user = User.new(user_params.strip)
        end
      else
        nil
      end
    # end
  end
  
end
