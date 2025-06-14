class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :product_name, null: false
      t.integer :product_price, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
