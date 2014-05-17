FactoryGirl.define do
  factory :gadget do
    sequence :name do |n|
      "test gadget #{n}"
    end
    description "describe me"
    user
  end
end

