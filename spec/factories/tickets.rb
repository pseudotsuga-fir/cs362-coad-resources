FactoryBot.define do
    factory :ticket do
        name {"Ticket Name"}
        description {"Ticket Description"}
        phone {"15555555555"}
        organization_id {nil}
        created_at {DateTime.new(2001,2,3,4,5,6)}
        updated_at {DateTime.new(2001,2,3,4,5,6)}
        closed {false}
        closed_at {DateTime.new(2001,2,3,4,5,6)}
        region {build_stubbed(:region)} 
        resource_category {build_stubbed(:resource_category)}
    end
end