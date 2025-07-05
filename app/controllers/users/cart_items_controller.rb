class Users::CartItemsController < Users::ApplicationController
  def create
    @cart_item = current_cart.cart_items.build(cart_item_params)

    if @cart_item.save
      redirect_to food_path(@cart_item.food), notice: 'カートに追加しました'
    else
      redirect_to food_path(@cart_item.food), alert: 'カートに追加できませんでした'
    end
  end

  private

  def cart_item_params
    params.expect(cart_item: %i[food_id])
  end
end
