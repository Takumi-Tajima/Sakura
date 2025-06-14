FactoryBot.define do
  factory :order do
    user { nil }
    shipping_name { "MyString" }
    shipping_address { "MyText" }
    phone_number { "MyString" }
    delivery_date { "2025-06-14" }
    delivery_time_slot { "MyString" }
    subtotal { 1 }
    shipping_cost { 1 }
    cod_fee { 1 }
    tax { 1 }
    total { 1 }
    status { "MyString" }
  end
end
