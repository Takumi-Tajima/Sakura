class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_amount
    cart_items.sum { |item| item.product.price * item.quantity }
  end

  def total_quantity
    cart_items.sum(:quantity)
  end

  def shipping_boxes_needed
    (total_quantity / 5.0).ceil
  end

  def shipping_cost
    shipping_boxes_needed * 600
  end

  def cod_fee
    amount = total_amount
    case amount
    when 0..9999
      300
    when 10000..29999
      400
    when 30000..99999
      600
    else
      1000
    end
  end

  def total_with_fees
    total_amount + shipping_cost + cod_fee
  end

  def total_with_tax
    (total_with_fees * 1.08).floor
  end
end
