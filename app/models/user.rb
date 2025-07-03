class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_one :cart, dependent: :destroy

  def create_cart
    Cart.create!(user: self)
  end
end
