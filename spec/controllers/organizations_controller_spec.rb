require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

#   approve_organization  POST   /organizations/:id/approve(.:format)                                                   organizations#approve
#   reject_organization   POST   /organizations/:id/reject(.:format)                                                    organizations#reject
# resources_organization  GET    /organizations/:id/resources(.:format)                                                 organizations#resources
#         organizations   GET    /organizations(.:format)                                                               organizations#index
#                         POST   /organizations(.:format)                                                               organizations#create
#      new_organization   GET    /organizations/new(.:format)                                                           organizations#new
#     edit_organization   GET    /organizations/:id/edit(.:format)                                                      organizations#edit
#          organization   GET    /organizations/:id(.:format)                                                           organizations#show
#                         PATCH  /organizations/:id(.:format)                                                           organizations#update
#                         PUT    /organizations/:id(.:format)                                                           organizations#update
#                         DELETE /organizations/:id(.:format)                                                           organizations#destroy
# new_organization_application GET    /new_organization_application(.:format)                                           organizations#new

  describe "individuals" do
    describe "#index" do
      it "redirects to the sign in page" do
        get :index
        expect(response).to redirect_to(:new_user_session)
      end
    end

    # describe "#show" do
    #   it "redirects to the sign in page" do
    #     get :show
    #     expect(response).to redirect_to(:new_user_session)
    #   end
    # end

    # describe "#create" do
    #   it "redirects to the sign in page" do
    #     get :create
    #     expect(response).to redirect_to(:new_user_session)
    #   end
    # end

    # describe "#new" do
    #   it "organization application redirects to the sign in page" do
    #     get :new_organization_application
    #     expect(response).to redirect_to(:new_user_session)
    #   end

    #   it "organization redirects to the sign in page" do
    #     get :new_organization
    #   end
    # end

    # describe "#edit" do
    #   it "redirects to the sign in page" do
    #     get :edit
    #     expect(response).to redirect_to(:new_user_session)
    #   end
    # end

    # describe "#update" do
    #   it "redirects to the sign in page" do
    #     get :update
    #     expect(response).to redirect_to(:new_user_session)
    #   end
    # end

    # describe "#update" do
    #   it "redirects to the sign in page" do
    #     get :update
    #     expect(response).to redirect_to(:new_user_session)
    #   end
    # end

    # describe "#destroy" do
    #   it "redirects to the sign in page" do
    #     get :destroy
    #     expect(response).to redirect_to(:new_user_session)
    #   end
    # end
  end

end
