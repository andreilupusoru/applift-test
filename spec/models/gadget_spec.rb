require 'spec_helper'

describe Gadget do
  describe "validates" do
    it "user_id is present" do
      build(:gadget, user_id: nil).should_not be_valid
    end

    it "has name" do
      build(:gadget, name: nil).should_not be_valid
    end
  end
end

