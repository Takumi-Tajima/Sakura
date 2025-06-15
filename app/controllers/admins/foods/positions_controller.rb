class Admins::Foods::PositionsController < Admins::ActionController::Base
  before_action :set_food, only: %i[update]

  def update
    @food.insert_at!(position_params)
  end

  private

  def set_food
    @food = Food.find(params.expect(:food_id))
  end

  def position_params
    params.expect(:position)
  end
end
