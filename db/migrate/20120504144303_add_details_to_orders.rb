class AddDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cart_id, :integer
  end
end
