require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  it "thanks user for applying" do    
    user = create(:user)
    user.confirm
    user.organization = nil
    user.save!
    log_in_as(user)
  
    visit "/organizations/new"

    choose("organization_liability_insurance_true")
    choose("organization_agreement_one_true")
    choose("organization_agreement_two_true")
    choose("organization_agreement_three_true")
    choose("organization_agreement_four_true")
    choose("organization_agreement_five_true")
    choose("organization_agreement_six_true")
    choose("organization_agreement_seven_true")
    choose("organization_agreement_eight_true")
    fill_in("organization_primary_name", with: "fakeName")
    fill_in("organization_name", with: "fakeOrgName")
    fill_in("organization_title", with: "fakeTitle")
    fill_in("organization_phone", with: "9719999999")
    fill_in("organization_secondary_name", with: "fakeSecondName")
    fill_in("organization_secondary_phone", with: "9718888888")
    fill_in("organization_email", with: "fake@fake.com")
    choose("organization_transportation_yes")
    
    click_on("Apply")

    expect(page).to have_text("Thank you for applying.")
  end
end
