class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product_name, presence: true
  validates :product_price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def subtotal
    product_price * quantity
  end
end
