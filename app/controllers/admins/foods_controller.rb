class Admins::FoodsController < Admins::ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.ordered_positions
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to admins_foods_path, notice: '食品を作成しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to admins_food_path(@food), notice: '食品を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!
    redirect_to admins_foods_path, notice: '食品を削除しました。', status: :see_other
  end

  private

  def set_food
    @food = Food.find(params.expect(:id))
  end

  def food_params
    params.expect(food: %i[name description price is_published food_image])
  end
end
