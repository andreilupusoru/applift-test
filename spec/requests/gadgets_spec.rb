require 'spec_helper'

describe "Gadgets" do
  let(:user) { create(:user) }

  describe "GET /gadgets" do
    context "doesn't allow access if not logged in" do
      it "redirects" do
        get gadgets_path
        response.status.should be(302)
      end
    end
  end

end

