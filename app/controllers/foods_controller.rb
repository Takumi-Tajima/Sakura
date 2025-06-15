class FoodsController < ApplicationController
  before_action :set_food, only: %i[show]
  def index
    @foods = Food.published.default_order
  end

  def show
  end

  private

  def set_food
    @food = Food.find(params.expect(:id))
  end
end
