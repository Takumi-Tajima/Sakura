class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :shipping_name, null: false
      t.text :shipping_address, null: false
      t.string :phone_number
      t.date :delivery_date, null: false
      t.string :delivery_time_slot, null: false
      t.integer :subtotal, null: false, default: 0
      t.integer :shipping_cost, null: false, default: 0
      t.integer :cod_fee, null: false, default: 0
      t.integer :tax, null: false, default: 0
      t.integer :total, null: false, default: 0
      t.string :status, null: false, default: 'pending'

      t.timestamps
    end

    add_index :orders, :status
  end
end
