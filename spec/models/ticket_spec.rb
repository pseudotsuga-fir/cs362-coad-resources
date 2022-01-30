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
end
