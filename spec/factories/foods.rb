FactoryBot.define do
  factory :food do
    name { Faker::Food.ingredient }
    description { Faker::Food.description }
    price { Faker::Number.between(from: 1, to: 5000) }
    is_published { true }
  end
end
