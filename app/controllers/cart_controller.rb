class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.current_cart
    @cart_items = @cart.cart_items.includes(:product)
  end
end
