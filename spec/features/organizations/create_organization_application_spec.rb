require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  it "thanks user for applying" do    
    user = create(:user, :organization)
    user.confirm
    log_in_as(user)
  
    visit "/organizations/new"
    expect(page).to have_text("Thank you for applying.")
  end
end
