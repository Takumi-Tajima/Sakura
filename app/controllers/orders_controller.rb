class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def new
    @cart = current_user.current_cart
    redirect_to cart_path, alert: 'カートが空です。' if @cart.cart_items.empty?
    
    @order = Order.new(
      shipping_name: current_user.shipping_name,
      shipping_address: current_user.shipping_address,
      phone_number: current_user.phone_number
    )
  end

  def create
    @cart = current_user.current_cart
    redirect_to cart_path, alert: 'カートが空です。' and return if @cart.cart_items.empty?

    @order = Order.new(order_params.merge(user: current_user))
    
    # Set basic delivery date (5 days from now for MVP - approximates 3 business days)
    @order.delivery_date = 5.days.from_now.to_date
    @order.delivery_time_slot = '14-16' # Default time slot for MVP
    
    if @order.valid?
      begin
        shipping_params = {
          shipping_name: @order.shipping_name,
          shipping_address: @order.shipping_address,
          phone_number: @order.phone_number
        }
        
        delivery_params = {
          delivery_date: @order.delivery_date,
          delivery_time_slot: @order.delivery_time_slot
        }
        
        @completed_order = Order.create_from_cart!(@cart, shipping_params, delivery_params)
        redirect_to order_path(@completed_order), notice: '注文が完了しました。'
      rescue ActiveRecord::RecordInvalid => e
        @order.errors.add(:base, '注文の作成に失敗しました。')
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    redirect_to orders_path, alert: '注文が見つかりません。' unless @order
  end

  def index
    @orders = current_user.orders.recent.includes(:order_items)
  end

  private

  def set_order
    @order = current_user.orders.find_by(id: params[:id])
  end

  def order_params
    params.require(:order).permit(:shipping_name, :shipping_address, :phone_number)
  end
end
