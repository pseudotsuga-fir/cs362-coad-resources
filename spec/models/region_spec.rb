require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region)  {Region.new(
    name: "Region"
  )}
  
  describe "attributes" do 
    it "has a name" do 
      region = Region.new
      expect(region).to respond_to(:name)
    end

    it "has a non empty name" do
      name = ""
      region = Region.new(name: name)
      expect(region).to_not be_valid
    end

    it "has a length of valid name" do
      name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      region = Region.new(name: name)
      expect(region).to_not be_valid
    end
  end

  describe "association" do
    it "Has many tickets" do
      should have_many :tickets
    end
  end

  describe "validators" do
    it "validates the presence of name" do
      should validate_presence_of(:name)
    end

    it "validates the length of name" do
      should validate_length_of(:name).is_at_least(1).is_at_most(255)
    end

    it "validates uniqueness of name" do
      should validate_uniqueness_of(:name).ignoring_case_sensitivity
    end
  end

  describe "#to_s" do
    it "returns the name" do
      name = 'Mt. Hood'
      region = Region.new(name: name)
      expect(region.to_s).to eq(name)
    end
  end

end
