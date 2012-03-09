class AddPurchasedOnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :purchased_on, :string
  end
end
