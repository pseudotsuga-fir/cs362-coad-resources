require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
#   tickets           POST   /tickets(.:format)                     tickets#create
#   new_ticket        GET    /tickets/new(.:format)                 tickets#new
#   ticket            GET    /tickets/:id(.:format)                 tickets#show
#   ticket_submitted  GET    /ticket_submitted(.:format)            static_pages#ticket_submitted
#   capture_ticket    POST   /tickets/:id/capture(.:format)         tickets#capture
#   release_ticket    POST   /tickets/:id/release(.:format)         tickets#release
#   close_ticket      PATCH  /tickets/:id/close(.:format)           tickets#close
#                     DELETE /tickets/:id(.:format)                 tickets#destroy

describe "individuals" do
  it "redirects to dashboard" do
    get :show, params: { id: 'fake' }
    expect(response).to redirect_to(:dashboard)

    post :capture, params: { id: 'fake' }
    expect(response).to redirect_to(:dashboard)

    post :release, params: { id: 'fake' }
    expect(response).to redirect_to(:dashboard)

    patch :close, params: { id: 'fake' }
    expect(response).to redirect_to(:dashboard)

    delete :destroy, params: { id: 'fake' }
    expect(response).to redirect_to(:dashboard)
  end
end

describe "organizations" do
  describe "rejected" do
    it "redirects to dashboard" do
      org_user = create(:user)
      org_user.confirm
      org_user.organization.reject
      org_user.organization.save!
      sign_in(org_user)

      get :show, params: { id: 'fake' }
      expect(response).to redirect_to(:dashboard)

      post :capture, params: { id: 'fake' }
      expect(response).to redirect_to(:dashboard)

      post :release, params: { id: 'fake' }
      expect(response).to redirect_to(:dashboard)

      patch :close, params: { id: 'fake' }
      expect(response).to redirect_to(:dashboard)

      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(:dashboard)
    end
  end

  describe "approved" do
    it "redirects to dashboard" do
      org_user = create(:user)
      org_user.confirm
      org_user.organization.approve
      org_user.organization.save!
      sign_in(org_user)

      delete :destroy, params: { id: 'fake' }
      expect(response).to redirect_to(:dashboard)
    end
  end
end

end
