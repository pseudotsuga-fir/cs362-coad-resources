FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "fake#{n}@fake.com" }
    password { "I am a password" }
  end
end