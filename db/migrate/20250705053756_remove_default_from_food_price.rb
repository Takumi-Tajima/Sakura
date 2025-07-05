class RemoveDefaultFromFoodPrice < ActiveRecord::Migration[8.0]
  def change
    change_column_default :foods, :price, from: 1, to: nil
  end
end
