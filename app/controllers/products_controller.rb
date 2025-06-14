class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.published
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params.expect(:id))
  end
end
