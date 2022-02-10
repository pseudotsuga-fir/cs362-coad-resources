FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "FakeName#{n}" }
    active { true }

    factory :inactive_resource_category do
      active { false }
    end
  end
end