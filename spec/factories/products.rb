FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    price { 1 }
    image_url { "MyString" }
    display_hidden { false }
    display_order { 1 }
  end
end
