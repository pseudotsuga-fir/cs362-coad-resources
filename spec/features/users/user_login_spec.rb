require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
    scenario "shows that user has logged in" do
        visit "/login"
        fill_in "Email address", with: "test@test.com"
        fill_in "Password", with: "password"
        click_on "commit"
        # expect(page).to have_text("Dashboard")
    end

end
