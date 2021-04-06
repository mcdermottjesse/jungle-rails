require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'Validations' do

    context "needs a first name, last name, email, password and password confirmation" do
    it "should create a user" do
    @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: "password", password_confirmation: "password")
    expect(@user).to be_valid
  end
end

    context "if no first name" do
    it "should not create a user" do
    @user = User.create(name: nil, last_name: 'Test', email: "test@test.com", password: "password", password_confirmation: "password")
    expect(@user).to_not be_valid
  end
end

    context "if no last name" do
    it "should not create a user" do
    @user = User.create(name: 'Test', last_name: nil, email: "test@test.com", password: "password", password_confirmation: "password")
    expect(@user).to_not be_valid
  end
end

    context "if no email" do
    it "should not create a user" do
    @user = User.create(name: 'Test', last_name: 'Test', email: nil, password: "password", password_confirmation: "password")
    expect(@user).to_not be_valid
  end
end

    context "if email already exists, case sensitivty is irrelevant" do
    it "should not create a user" do
    @user1 = User.create(name: 'Test1', last_name: 'Test1', email: "test@test.com", password: "password", password_confirmation: "password")
    @user2 = User.create(name: 'Test2', last_name: 'Test2', email: "test@test.com", password: "password", password_confirmation: "password")
    @user3 = User.create(name: 'Test3', last_name: 'Test3', email: "TEST@TEST.COM", password: "password", password_confirmation: "password")
    expect(@user2).to_not be_valid
    expect(@user2.errors[:email]).to include("has already been taken")
    expect(@user3).to_not be_valid
    expect(@user3.errors[:email]).to include("has already been taken")
  end
end


    context "if no password" do
    it "should not create a user" do
    @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: nil, password_confirmation: "password")
    expect(@user).to_not be_valid
  end
end

    context "if no password confirmation" do
    it "should not create a user" do
    @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: "password", password_confirmation: nil)
    expect(@user).to_not be_valid
  end
end

    context "if no passwords do not match" do
    it "should not create a user" do
    @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: "password", password_confirmation: "passworddonotmatch")
    expect(@user).to_not be_valid
  end
end

      context "if password is less than 5 characters" do
      it "should not create a user" do
      @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: "test", password_confirmation: "test")
      expect(@user).to_not be_valid
    end
  end
end
  
describe '.authenticate_with_credentials' do

    context "needs email and password" do
    it "should login user" do
    @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: "password", password_confirmation: "password")
    @user = User.authenticate_with_credentials("test@test.com", "password")
    expect(@user).to_not be(nil)
  end
end

    context "if no email is entered" do
    it "should not login user" do 
    @user = User.authenticate_with_credentials("", "password")
    expect(@user).to be(nil)
  end
end

    context "if no password is entered" do
    it "should not login user" do
    @user = User.authenticate_with_credentials("test@test.com", "")
    expect(@user).to be(nil)
  end
end

      context "email case sensitivity is irrelevant when logging in" do
      it "should login user" do
      @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: "password", password_confirmation: "password")
      @user = User.authenticate_with_credentials("TEST@TEST.com", "password")
      expect(@user).to_not be(nil)
    end
  end

  context "email case whitespace is irrelevant when logging in" do
    it "should login user" do
    @user = User.create(name: 'Test', last_name: 'Test', email: "test@test.com", password: "password", password_confirmation: "password")
    @user = User.authenticate_with_credentials(" test@test.com", "password")
    expect(@user).to_not be(nil)
  end
end

end
end


