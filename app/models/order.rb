class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
  validates :delivery_date, presence: true
  validates :delivery_time_slot, presence: true, inclusion: {
    in: %w[8-12 12-14 14-16 16-18 18-20 20-21],
  }
  validates :status, presence: true, inclusion: {
    in: %w[pending confirmed shipped delivered cancelled],
  }

  scope :by_status, ->(status) { where(status: status) }
  scope :recent, -> { order(created_at: :desc) }

  def self.create_from_cart!(cart, shipping_params, delivery_params)
    Order.transaction do
      order = create!(
        user: cart.user,
        shipping_name: shipping_params[:shipping_name],
        shipping_address: shipping_params[:shipping_address],
        phone_number: shipping_params[:phone_number],
        delivery_date: delivery_params[:delivery_date],
        delivery_time_slot: delivery_params[:delivery_time_slot],
        subtotal: cart.total_amount,
        shipping_cost: cart.shipping_cost,
        cod_fee: cart.cod_fee,
        tax: cart.total_with_tax - cart.total_with_fees,
        total: cart.total_with_tax
      )

      cart.cart_items.each do |cart_item|
        order.order_items.create!(
          product: cart_item.product,
          product_name: cart_item.product.name,
          product_price: cart_item.product.price,
          quantity: cart_item.quantity
        )
      end

      cart.cart_items.destroy_all
      order
    end
  end

  def item_total
    order_items.sum { |item| item.product_price * item.quantity }
  end
end
