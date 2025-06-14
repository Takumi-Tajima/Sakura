class Admins::ProductsController < Admins::ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.order(:display_order, :created_at)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admins_product_path(@product), notice: '商品を作成しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admins_product_path(@product), notice: '商品を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admins_products_path, notice: '商品を削除しました。'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :display_hidden, :display_order, :image)
  end
end
