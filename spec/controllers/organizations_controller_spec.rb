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
    it "redirects to the sign in page" do
      post :approve, params: { id: 1 }
      expect(response).to redirect_to(:new_user_session)

      post :reject, params: { id: 1 }
      expect(response).to redirect_to(:new_user_session)

      get :index
      expect(response).to redirect_to(:new_user_session)

      get :show, params: { id: 1 }
      expect(response).to redirect_to(:new_user_session)

      post :create
      expect(response).to redirect_to(:new_user_session)

      get :new
      expect(response).to redirect_to(:new_user_session)

      get :edit, params: { id: 1 }
      expect(response).to redirect_to(:new_user_session)

      patch :update, params: { id: 1 }
      expect(response).to redirect_to(:new_user_session)

      put :update, params: { id: 1 }
      expect(response).to redirect_to(:new_user_session)
    end
  end

  describe "organizations" do
    it "redirects to the dashboard page" do
      org_user = create(:user)
      org_user.confirm
      sign_in(org_user)

      post :approve, params: { id: 1 }
      expect(response).to redirect_to(:dashboard)

      post :reject, params: { id: 1 }
      expect(response).to redirect_to(:dashboard)

      get :show, params: { id: 1 }
      expect(response).to redirect_to(:dashboard)

      get :edit, params: { id: 1 }
      expect(response).to redirect_to(:dashboard)

      patch :update, params: { id: 1 }
      expect(response).to redirect_to(:dashboard)

      put :update, params: { id: 1 }
      expect(response).to redirect_to(:dashboard)
    end
  end

end
