require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

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
            patch :update, params: { id: 'fake' }
            expect(response).to redirect_to(new_user_session_path)
            put :update, params: { id: 'fake' }
            expect(response).to redirect_to(new_user_session_path)
            patch :activate, params: { id: 'fake' }
            expect(response).to redirect_to(new_user_session_path)
            patch :deactivate, params: { id: 'fake' }
            expect(response).to redirect_to(new_user_session_path)
            delete :destroy, params: { id: 'fake' }
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
            get :show, params: { id: 'fake' }
            expect(response).to redirect_to(dashboard_path)
            get :new
            expect(response).to redirect_to(dashboard_path)
            post :create
            expect(response).to redirect_to(dashboard_path)
            get :edit, params: { id: 'fake' }
            expect(response).to redirect_to(dashboard_path)
            patch :update, params: { id: 'fake' }
            expect(response).to redirect_to(dashboard_path)
            put :update, params: { id: 'fake' }
            expect(response).to redirect_to(dashboard_path)
            patch :activate, params: { id: 'fake' }
            expect(response).to redirect_to(dashboard_path)
            patch :deactivate, params: { id: 'fake' }
            expect(response).to redirect_to(dashboard_path)
            delete :destroy, params: { id: 'fake' }
            expect(response).to redirect_to(dashboard_path)
        end
    end
end
