FactoryBot.define do
  factory :organization do
    sequence(:name) { |n| "FakeName#{n}" }
    status { "submitted" }
    phone { "0000000000" }
    sequence(:email) { |n| "fake#{n}@fake.com" }
    description { "This is a fake organization" }
    rejection_reason { "Fake Rejection" }
    liability_insurance { false }
    primary_name { "1111111111" }
    secondary_name { "FakeSecondName" }
    secondary_phone { "2222222222" }
    title { "FakeTitle" }
    transportation { "no" }
  end
end