require 'spec_helper'

describe GadgetsController do
  render_views
  let(:user) { create(:user) }
  let(:gadget) { create(:gadget, user: user) }

  context "user is logged in" do
    before(:each) do
      sign_in(user)
    end

    describe "GET index" do
      it "works" do
        get :index
        response.should be_success
      end

      it "gets all gadgets" do
        gadget

        get :index
        assigns(:gadgets).should eq([gadget])
      end
    end
  end 
end
