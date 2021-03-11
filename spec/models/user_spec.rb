require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    before(:each) do

      @a_user = User.create!( 
        email: 'fake@fake.com', 
        password: 'guest',
        password_confirmation: 'guest',
        name: 'elon musk',
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
      
      new_user = User.new()
      new_user.email = 'fake@fake.com'
      new_user.name = "fakeerton"
      new_user.save
      
      expect(new_user).to_not be_valid#
      
    end

    it "does not create a new user record when email address is already taken with spaces" do
      
      new_user = User.new()
      new_user.email = '   fake@fake.com   '
      new_user.name = "fakeerton"
      new_user.save
      
      expect(new_user).to_not be_valid#
      
    end

    it "does not create a new user record when email address is already taken, checking case" do
      
      new_user = User.new()
      new_user.email = 'FAKE@fAKe.cOm'
      new_user.name = "fakeerton"
      new_user.save

      expect(new_user).to_not be_valid#
      
    end

    it "does not create a new user record when email field is empty" do
      
      new_user = User.new()
      new_user.email = ''
      new_user.name = "fakeerton"
      new_user.save

      expect(new_user.email.empty?).to be_truthy
      expect(new_user).to_not be_valid#
    end

    it "does not create a new user record when name field is empty" do
      
      new_user = User.new()
      new_user.email = 'fake@fake.com'
      new_user.name = ""
      new_user.save

      expect(new_user.name.empty?).to be_truthy
      expect(new_user).to_not be_valid#
    end

    it "does not create a new user record when password is below minimum length" do
      expect(@a_user.password.length).to be > 4
      expect(@a_user.password_confirmation.length).to be > 4
    end
  end

  describe '.authenticate_with_credentials' do

    it "does not create a new user record when password doesn't match" do
      new_user = User.new()
      new_user.email = 'fake2@fake.com'
      new_user.name = "fakeerton"
      new_user.password = "1234"
      new_user.password_confirmation = "1235"
      new_user.save
      expect(new_user).to_not be_valid#
      
    end



  end
end
