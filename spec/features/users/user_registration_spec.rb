require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
    scenario "A successful user registration" do
        visit "/signup"
        fill_in "Email address", with: "test@test.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        check("I'm not a robot")

    end
end
