FactoryBot.define do
  factory :user do
    email { "test@test.org" }
    password { "I am a password" }
  end
end