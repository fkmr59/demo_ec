class RenameOrderUserIdOrderItemIdOrderCartIdColumnToAddresses < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :order_user_id, :user_id
    rename_column :addresses, :order_item_id, :item_id
    rename_column :addresses, :order_cart_id, :cart_id
  end
end