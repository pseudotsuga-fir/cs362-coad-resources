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

  describe "methods" do
    describe "unspecified" do
      it "finds or creates an unspecified record if none exist" do
        unspecified_resource_category = ResourceCategory.unspecified
        expect(unspecified_resource_category.name).to eq('Unspecified')
      end
    end

    describe "activate" do
      it "changes the status of an inactive resrouce category to true" do
        resource_category.active = false
        resource_category.activate
        expect(resource_category.active).to be_truthy
      end
    end

    describe "deactivate" do
      it "changes the status of an active resrouce category to false" do
        resource_category.active = true
        resource_category.deactivate
        expect(resource_category.active).to be_falsey
      end
    end

    describe "inactive?" do
      it "returns false when it is active" do
        resource_category.active = true
        expect(resource_category.inactive?).to be_falsey
      end

      it "returns true when it is inactive" do
        resource_category.active = false
        expect(resource_category.inactive?).to be_truthy
      end
    end

    describe "to_s" do
      it "returns the name of the resource category" do
        name = "FakeName2"
        resource_category.name = name
        expect(resource_category.to_s).to eq(name)
      end
    end
  end
end
