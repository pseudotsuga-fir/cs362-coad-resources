require 'rails_helper'

RSpec.describe Region, type: :model do
  
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

  describe "#to_s" do
    it "returns the name" do
      name = 'Mt. Hood'
      region = Region.new(name: name)
      expect(region.to_s).to eq(name)
    end
  end

end
