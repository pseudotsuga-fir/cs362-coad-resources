require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  it "tells admin creation was successful" do
    admin = create(:user, :admin)
    admin.confirm
    log_in_as(admin)

    visit "/dashboard"
    click_on("Regions")
    click_on("Add Region")
    region_name = "FakestRegionEver"
    fill_in("Name", with: region_name)
    click_on("Add Region")
    expect(page).to have_text("Region successfully created.")
  end

end
