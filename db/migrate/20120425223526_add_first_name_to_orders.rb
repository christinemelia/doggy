class AddFirstNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :first_name, :string
  end
end
