require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let(:ticket) {Ticket.new(
        name: "SpongeBob",
        phone: "5555555555",
        region_id: 555,
        resource_category_id: 555,
        description: "This is a ticket.",
        organization_id: 555,
        created_at: DateTime.new(2001,2,3,4,5,6),
        updated_at: DateTime.new(2001,2,3,4,5,6),
        closed: false,
        closed_at: DateTime.new(2001,2,3,4,5,6)
    ) }

    describe "Attributes" do
        it "Has a name" do
            expect(ticket).to respond_to(:name)
        end

        it "Has a phone number" do
            expect(ticket).to respond_to(:phone)
        end

        it "Has a description" do
            expect(ticket).to respond_to(:description)
        end

        it "Has a 'Closed' state" do 
            expect(ticket).to respond_to(:closed)
        end

        it "Has a 'Closed at' time" do 
            expect(ticket).to respond_to(:closed_at)
        end
    end

    describe "Associations" do   
        it "Belongs to Region" do
            should belong_to :region
        end

        it "Belongs to Resource Category" do
            should belong_to :resource_category
        end

        it "Belongs to Organization" do
            should belong_to :organization
        end
    end  

    describe "Validators" do
        it "Validates presence of name" do
          should validate_presence_of(:name)
        end  

        it "Validates presence of phone" do
            should validate_presence_of(:phone)
        end

        it "Validates presence of region ID" do
            should validate_presence_of(:region_id)
        end

        it "Validates presence of resource category ID" do
            should validate_presence_of(:resource_category_id)
        end

        it "Validates length of name" do
            should validate_length_of(:name).is_at_least(1).is_at_most(255)
        end

        it "Validates length of description" do
            should validate_length_of(:description).is_at_most(1020)
        end
    end 

    describe "Methods" do
        it "Checks if ticket is open." do
            !ticket.open?
            ticket.open?
            expect(ticket.open?).to eq(true)
        end

        # it "Checks if Organization is not empty" do
        #     # !ticket.captured?
        #     ticket.captured?
        #     expect(ticket.captured?).to eq(true)
        # end

        it "Returns ticket ID" do
            id = ticket.id
            expect(ticket.to_s).to eq("Ticket #{id}")
        end
    end
end
