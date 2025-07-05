class AddPositionToFoods < ActiveRecord::Migration[8.0]
  def change
    add_column :foods, :position, :integer
  end
end
