class UsersController < ApplicationController

  def new
    # @errors = user.errors.full_messages
  end

  def create
    
    
    user = User.new(user_params)
    if user.save
      # if params(:email).blank? || params(:name).blank?
      #   error: 'name and email fields are both required'
      #   redirect_to '/signup'
      # end
      session[:user_id] = user.id
      redirect_to '/'
    else
      
      # redirect_to '/signup'
      @errors = user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
