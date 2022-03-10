require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    scenario "shows that ticket has been created by non logged in user" do
        create(:region)
        create(:resource_category)
        visit "/tickets/new"
        expect(page).to have_content("This creates ticket")
        fill_in "Full Name", with: "Fake Name"
        fill_in "Phone Number", with: "5415415415"
        select "FakeName1", from: "Region"
        select "FakeName1", from: "Resource Category"
        fill_in "Description", with: "Fake Description"
        click_button("Send this help request")
        expect(page).to have_content "Ticket Submitted"
    end
end
