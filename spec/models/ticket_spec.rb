require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let(:ticket) {build(:ticket)}

    describe "attributes" do
        it "has a name" do
            expect(ticket).to respond_to(:name)
        end

        it "has a phone number" do
            expect(ticket).to respond_to(:phone)
        end

        it "has a description" do
            expect(ticket).to respond_to(:description)
        end

        it "has a 'Closed' state" do 
            expect(ticket).to respond_to(:closed)
        end

        it "has a 'Closed at' time" do 
            expect(ticket).to respond_to(:closed_at)
        end
    end

    describe "associations" do   
        it "belongs to Region" do
            should belong_to :region
        end

        it "belongs to Resource Category" do
            should belong_to :resource_category
        end

        it "belongs to Organization" do
            should belong_to :organization
        end
    end  

    describe "validators" do
        it "validates presence of name" do
          should validate_presence_of(:name)
        end  

        it "validates presence of phone" do
            should validate_presence_of(:phone)
        end

        it "validates presence of region ID" do
            should validate_presence_of(:region_id)
        end

        it "validates presence of resource category ID" do
            should validate_presence_of(:resource_category_id)
        end

        it "validates length of name" do
            should validate_length_of(:name).is_at_least(1).is_at_most(255)
        end

        it "validates length of description" do
            should validate_length_of(:description).is_at_most(1020)
        end
    end

    describe "methods" do
        it "checks if ticket is open." do
            !ticket.open?
            ticket.open?
            expect(ticket.open?).to eq(true)
        end

        it "returns ticket ID" do
            id = ticket.id
            expect(ticket.to_s).to eq("Ticket #{id}")
        end

        it "is captured when it has an organization" do
            organization = Organization.new(name: "Fake Organization")
            ticket = Ticket.new(organization: organization)
            expect(ticket.captured?).to be_truthy
        end
    end
end
