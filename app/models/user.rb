class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  def current_cart
    cart || create_cart!
  end

  def has_shipping_info?
    shipping_name.present? && shipping_address.present?
  end
end
