FactoryBot.define do
  factory :user do
    association :organization, factory: :organization
    
    sequence(:email) { |n| "fake#{n}@fake.com" }
    password { "I am a password" }
  end
end