require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe "#dashboard_for" do
    it "gives admins the admin dashbaord" do
      user = build(:user)
      user.role = :admin
      expect(helper.dashboard_for(user)).to eq('admin_dashboard')
    end

    it "gives submitted organization users the organization submitted dashbaord" do
      user = build(:user)
      user.role = :organization
      user.organization.status = :submitted
      expect(helper.dashboard_for(user)).to eq('organization_submitted_dashboard')
    end

    it "gives approved organization the organization approved dashbaord" do
      user = build(:user)
      user.role = :organization
      user.organization.status = :approved
      expect(helper.dashboard_for(user)).to eq('organization_approved_dashboard')
    end

    it "gives create application dashboard for other users" do
      user = build(:user)
      user.role = :organization
      user.organization.status = :rejected
      expect(helper.dashboard_for(user)).to eq('create_application_dashboard')
    end
  end
end
