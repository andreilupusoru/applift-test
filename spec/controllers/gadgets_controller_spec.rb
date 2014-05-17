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


    describe "POST create" do
      context "with valid params" do
        it "creates a new gadget" do
          expect {
              post :create, gadget: { name: "test", description: "" }
                }.to change{ Gadget.count }.by(1)
          end
      end
 
      context "with invalid params" do
        it "does not create an invalid gadget" do
          expect {
              post :create, gadget: { name: "", description: "description" }
                }.to_not change{ Gadget.count }
          end
      end
    end













  end 
end
