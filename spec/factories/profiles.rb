FactoryBot.define do
    factory :profile do
        nickname { Faker::Name.name }
    end
end