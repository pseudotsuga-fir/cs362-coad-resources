FactoryBot.define do
  factory :region do
    sequence(:name) { |n| "FakeName#{n}" }
  end
end