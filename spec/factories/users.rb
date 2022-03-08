FactoryBot.define do
  factory :user do
    association :organization, factory: :organization
    
    sequence(:email) { |n| "fake#{n}@fake.com" }
    password { "I am a password" }
  end

  trait :organization_user do
    organization
    role { 'organization' }
  end

  trait :admin do
    role { 'admin' }
  end
end