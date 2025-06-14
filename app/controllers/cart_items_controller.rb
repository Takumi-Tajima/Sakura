class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: %i[update destroy]

  def create
    @product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i.clamp(1, 99)

    @cart = current_user.current_cart
    @cart_item = @cart.cart_items.find_by(product: @product)

    if @cart_item
      @cart_item.quantity += quantity
      @cart_item.save!
    else
      @cart.cart_items.create!(product: @product, quantity: quantity)
    end

    redirect_to cart_path, notice: 'カートに商品を追加しました。'
  rescue ActiveRecord::RecordInvalid
    redirect_to product_path(@product), alert: 'カートに商品を追加できませんでした。'
  end

  def update
    quantity = params[:cart_item][:quantity].to_i.clamp(1, 99)

    if @cart_item.update(quantity: quantity)
      redirect_to cart_path, notice: '数量を更新しました。'
    else
      redirect_to cart_path, alert: '数量を更新できませんでした。'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path, notice: 'カートから商品を削除しました。'
  end

  private

  def set_cart_item
    @cart_item = current_user.current_cart.cart_items.find(params[:id])
  end
end
