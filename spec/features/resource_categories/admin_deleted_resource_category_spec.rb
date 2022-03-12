require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  it "alerts the admin that it has been deleted" do
    admin = create(:user, :admin)
    admin.confirm
    log_in_as(admin)

    resource_category = create(:resource_category)

    visit("/resource_categories")
    click_on(resource_category.name)
    click_on("Delete")
    
    expect(page).to have_text("Category #{resource_category.name} was deleted.")
  end
end
