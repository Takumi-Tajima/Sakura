class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :food

  validates :quantity, numericality: { greater_than: 0 }
end
