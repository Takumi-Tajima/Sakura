FactoryBot.define do
  factory :user do
    name { '田島 匠' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password123' }
    confirmed_at { Time.current }
  end
end
