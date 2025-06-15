class CreateFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ''
      t.integer :price, null: false, default: 1
      t.boolean :is_published, null: false, default: false

      t.timestamps
    end
  end
end
