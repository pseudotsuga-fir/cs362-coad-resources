FactoryBot.define do
    factory :ticket do
        name {"Ticket Name"}
        discription {"Ticket Discription"}
        phone {"5555555555"}
        organization_id {555}
        created_at {DateTime.new(2001,2,3,4,5,6)}
        updated_at {DateTime.new(2001,2,3,4,5,6)}
        closed {false}
        closed_at {DateTime.new(2001,2,3,4,5,6)}
        resource_category_id {555}
        region_id {555}
    end