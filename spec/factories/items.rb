FactoryBot.define do
    factory :item do
        content { Faker::Lorem.characters(number: 140) }
    end
end