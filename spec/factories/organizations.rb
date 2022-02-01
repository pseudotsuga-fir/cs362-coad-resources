FactoryBot.define do
  factory :organization do
    name { "FakeName" }
    status { "submitted" }
    phone { "0000000000" }
    email { "fake@fake.com" }
    description { "This is a fake organization" }
    rejection_reason { "Fake Rejection" }
    created_at { DateTime.new(2001,2,3,4,5,6) }
    updated_at { DateTime.new(2001,2,3,4,5,6) }
    liability_insurance { false }
    primary_name { "1111111111" }
    secondary_name { "FakeSecondName" }
    secondary_phone { "2222222222" }
    title { "FakeTitle" }
    transportation { "no" }
  end
end