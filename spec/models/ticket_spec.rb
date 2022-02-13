require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let(:ticket) {create(:ticket)}

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
        it "validates phone format" do
            invalid_phone = build_stubbed(:ticket, phone: "555555") 
            expect(invalid_phone).to be_invalid
            expect(ticket).to be_valid
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

    describe "scopes" do
        let (:open_ticket) {
             create(:ticket) 
        }
        let (:closed_ticket) {
             create(:ticket, closed: true) 
        }
        let (:all_open_organizations) {
            create(:ticket, organization_id: 1)
        }
        let (:closed_organization_ticket) {
            create(:ticket, organization_id: 1, closed: true)
        }

        it "returns open ticket" do
            expect(Ticket.open).to_not include(closed_ticket)   
            expect(Ticket.open).to include(open_ticket)
        end
        it "returns closed ticket" do
            expect(Ticket.closed).to_not include(open_ticket)
            expect(Ticket.closed).to include(closed_ticket)
        end
        it "returns open organizations that have an ID" do
            expect(Ticket.all_organization).to include(all_open_organizations)
        end
        it "returns open organizations" do 
            expect(Ticket.organization(all_open_organizations)).to include(all_open_organizations)
        end
        it "returns closed organization" do
            expect(Ticket.closed_organization(closed_organization_ticket)).to include(closed_organization_ticket)
        end
        it "returns ticket with requested region id" do
            expect(Ticket.region(ticket.region_id)).to include(ticket)
            
        end
        it "returns resource category with given id" do
            expect(Ticket.resource_category(ticket.resource_category_id)).to include(ticket)
        end
    end
end


