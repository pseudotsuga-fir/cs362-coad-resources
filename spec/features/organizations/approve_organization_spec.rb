require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  it "gives success?" do
    admin = create(:user, :admin)
    admin.confirm
    log_in_as(admin)

    visit "/organizations"
    click_link("Pending")
    click_on("Review")
    click_on("Approve")
    expect(page).to have_text("has been approved.")

  end
end
