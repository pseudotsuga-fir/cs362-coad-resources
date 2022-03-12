require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
  it "shows user their organization afterward" do
    user = create(:user, :organization)
    user.confirm
    log_in_as(user)
    user.organization.approve
    user.organization.save!

    visit "/dashboard"
    
    click_on("Edit Organization")
    click_on("Update Organization")
    expect(page).to have_current_path("/organizations/#{user.organization.id}")
  end
end
