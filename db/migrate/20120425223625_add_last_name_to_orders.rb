class AddLastNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :last_name, :string
  end
end
