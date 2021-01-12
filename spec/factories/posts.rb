FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
    category { Faker::Lorem.characters(number:2) }
  end
end
