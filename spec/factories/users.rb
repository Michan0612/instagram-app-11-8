FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    username { Faker::Lorem.characters(number: 10) }
  end

  trait :with_profile do
    after :build do |user|
        build(:profile, user: user)
    end
  end
end
