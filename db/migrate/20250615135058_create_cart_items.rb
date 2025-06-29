class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true, index: false
      t.references :food, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
      t.index %i[cart_id food_id], unique: true
    end
  end
end
