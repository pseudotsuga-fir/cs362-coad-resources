require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) { build(:resource_category) }

  describe "atttributes" do
    it "has a name" do
      expect(resource_category).to respond_to(:name)
    end

    it "has an active status" do
      expect(resource_category).to respond_to(:active)
    end
  end
  
  describe "validators" do
    it "validates presence of name" do
      should validate_presence_of(:name)
    end

    it "validates length of name" do
      should validate_length_of(:name).
        is_at_least(1).is_at_most(255)
    end

    it "validates uniqueness of name" do
      should validate_uniqueness_of(:name).case_insensitive
    end
  end

  describe "associations" do
    it "has and belongs to many organizations" do
      should have_and_belong_to_many :organizations
    end

    it "has many tickets" do
      should have_many :tickets
    end
  end
end
