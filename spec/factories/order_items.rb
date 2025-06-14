FactoryBot.define do
  factory :order_item do
    order { nil }
    product { nil }
    product_name { "MyString" }
    product_price { 1 }
    quantity { 1 }
  end
end
