class User < ActiveRecord::Base

  has_secure_password

  def authenticate_with_credentials(email, password)
    if email == "" || email == nil || passord == "" || password == nil
      nil
    else 
    
      #if email and password are authenticated, retunr instance variable, else nil
      user = User.find_by_email(email.strip.downcase)
      # If the user exists AND the password entered is correct.
      if user && user.authenticate(password)
        @user = User.new(user_params.strip)
      else
        nil
      end
    end
  end
  
end
