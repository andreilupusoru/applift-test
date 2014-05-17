
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password "12345678"
  end
end

