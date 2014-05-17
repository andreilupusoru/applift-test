require 'spec_helper'

describe User do
  describe "is not valid" do
    it "if he does not have email" do
      build(:user, email: nil).should_not be_valid
    end

    it "if email is not unique" do
      u = create(:user)
      build(:user, email: u.email).should_not be_valid
    end

    it "is missing password" do
      build(:user, password: nil).should_not be_valid
    end

    it "password is too short" do
      build(:user, password: 123456).should_not be_valid
    end
  end
end

