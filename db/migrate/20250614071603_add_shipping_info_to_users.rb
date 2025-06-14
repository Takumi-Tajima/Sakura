class AddShippingInfoToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :shipping_name, :string
    add_column :users, :shipping_address, :text
    add_column :users, :phone_number, :string
  end
end
