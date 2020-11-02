FactoryBot.define do
    factory :item do
        content { Faker::Lorem.characters(number: 140) }
        after(:build) do |item|
            item.photos.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'images', 'avatar1.png')), filename: 'avatar1.png', content_type: 'image/png')
        end
    end
end