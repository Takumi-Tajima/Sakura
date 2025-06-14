class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false
      t.boolean :display_hidden, default: false, null: false
      t.integer :display_order, default: 0, null: false

      t.timestamps
    end

    add_index :products, :display_order
  end
end
