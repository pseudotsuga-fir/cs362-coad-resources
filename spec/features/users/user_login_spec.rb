require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
    scenario "shows that user has logged in" do
        visit "/login"
        fill_in "Email address", with: "breyes815@gmail.com"
        fill_in "Password", with: "Baboon101"
        click_on "commit"
        expect(page).to have_text("Dashboard")
    end

end
