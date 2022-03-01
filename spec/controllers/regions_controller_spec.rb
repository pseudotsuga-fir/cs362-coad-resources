require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

    describe "non logged in user" do
        it "redirects to login page" do

            get :index
            expect(response).to redirect_to(new_user_session_path)
            get :show, params: { id: 'fake' } 
            expect(response).to redirect_to(new_user_session_path)
            get :new
            expect(response).to redirect_to(new_user_session_path)
            post :create
            expect(response).to redirect_to(new_user_session_path)
            get :edit, params: { id: 'fake' }
            expect(response).to redirect_to(new_user_session_path)
            get :update, params: { id: 'fake' }
            expect(response).to redirect_to(new_user_session_path)
            get :destroy, params: { id: 'fake' }
            expect(response).to redirect_to(new_user_session_path)
        end
    end

    describe "logged in organization user" do
        it "redirects to dashboard" do

            logged_in_organization_user = build(:user, :organization_user)
            logged_in_organization_user.confirm
            sign_in(logged_in_organization_user)

            get :index
            expect(response).to redirect_to(dashboard_path)
            get :show, params: {id: 'fake'}
            expect(response).to redirect_to(dashboard_path)
            get :new
            expect(response).to redirect_to(dashboard_path)
            post :create
            expect(response).to redirect_to(dashboard_path)
            get :edit, params: {id: 'fake'}
            expect(response).to redirect_to(dashboard_path)
            get :update, params: {id: 'fake'}
            expect(response).to redirect_to(dashboard_path)
            get :destroy, params: {id: 'fake'}
            expect(response).to redirect_to(dashboard_path)
        end
    end
end
