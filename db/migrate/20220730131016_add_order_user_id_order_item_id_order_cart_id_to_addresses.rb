class AddOrderUserIdOrderItemIdOrderCartIdToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :order_user_id, :integer
    add_column :addresses, :order_item_id, :integer
    add_column :addresses, :order_cart_id, :integer
  end
end
