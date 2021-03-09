require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    before(:each) do

      @a_user = User.new( 
        email: 'fake@fake.com', 
        password: 'guest',
        password_confirmation: 'guest',
        first_name: 'elon',
        last_name: 'musk'
      )
    end
    
    
    it "creates a new user record when passwords match" do
      
      expect(@a_user).to be_valid
      expect(@a_user.password == @a_user.password_confirmation).to be_truthy
    end

    it "does not create a new user record when password does not match confirmation" do
      @a_user.password_confirmation = 'whatisitagain'
      expect(@a_user).to_not be_valid
      expect(@a_user.password == @a_user.password_confirmation).to be_falsey
    end

    it "does not create a new user record when password does not match confirmation" do
      @a_user.password_confirmation = 'whatisitagain'
      expect(@a_user).to_not be_valid
      expect(@a_user.password == @a_user.password_confirmation).to be_falsey
      expect(@a_user.password).to_not be_nil
      expect(@a_user.password_confirmation).to_not be_nil
    end

    it "does not create a new user record when email address is already taken" do
      before do 
        user_with_same_email = @a_user.dup
        user_with_same_email.email = 'FAKE@FAKE.com'
        user_with_same_email.save!
      end
      expect(@a_user).to_not be_valid
      
    end

    it "does not create a new user record when email field is empty" do
      before do
        @a_user.email = ""
      end
      expect(@a_user.email.empty?).to be_truthy
      expect(@a_user).to_not be_valid
    end

    it "does not create a new user record when first name field is empty" do
      before do
        @a_user.first_name = ""
      end
      expect(@a_user.first_name.empty?).to be_truthy
      expect(@a_user).to_not be_valid
    end

    it "does not create a new user record when last name field is empty" do
      before do
        @a_user.last_name = ""
      end
      expect(@a_user.last_name.empty?).to be_truthy
      expect(@a_user).to_not be_valid
    end

    it "does not create a new user record when password is below minimum length" do
      expect(@a_user.password.length).to be > 4
      expect(@a_user.password_confirmation.length).to be > 4
  
    end


end
