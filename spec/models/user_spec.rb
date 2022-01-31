require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.new(
      email: "test@test.org",
      password: "I am a password"
    )
  }

  describe "attributes" do
    it "has an email" do
      expect(User.new).to respond_to(:email)
    end

    it "has a role" do
      expect(User.new).to respond_to(:role)
    end
  end

  describe "validators" do
    it "validates presence of email" do
      should validate_presence_of(:email)
    end

    it "validates presence of password" do
      should validate_presence_of(:password)
    end

    it "validate length of email" do
      should validate_length_of(:email).
      is_at_least(1).is_at_most(255)
    end

    it "validate uniqueness of email" do
      should validate_uniqueness_of(:email).case_insensitive
    end

    it "rejects emails without @" do
      user.email = "test.com"
      expect(user).to be_invalid
    end

    it "rejects emails without domain" do
      user.email = "test@test"
      expect(user).to be_invalid
    end

    it "accepts valid emails" do
      user.email = "test@test.xyz"
      expect(user).to be_valid
    end

    it "validates length of password" do
      should validate_length_of(:password).
        is_at_least(7).is_at_most(255)
    end
  end
end
