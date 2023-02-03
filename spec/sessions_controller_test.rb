require 'rails_helper'

describe SessionsController, type: :controller do
  describe "POST #create" do
    context "when the credentials are correct" do
      let(:user) { create(:user) }

      it "logs in the user" do
        post :create, params: { email: user.email, password: user.password }
        expect(session[:user_id]).to eq user.id
      end

      it "redirects to the root path with a welcome message" do
        post :create, params: { email: user.email, password: user.password }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq "Welcome back, #{user.email}"
      end
    end

    context "when the credentials are incorrect" do
      let(:user) { create(:user) }

      it "renders the new template" do
        post :create, params: { email: user.email, password: "incorrect" }
        expect(response).to render_template(:new)
      end

      it "displays an error message" do
        post :create, params: { email: user.email, password: "incorrect" }
        expect(flash.now[:alert]).to eq "Incorrect email or password"
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      log_in_user
    end

    it "logs out the user" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the root path with a goodbye message" do
      delete :destroy
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq "Goodbye!"
    end
  end
end
