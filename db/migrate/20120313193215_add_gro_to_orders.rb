class AddGroToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :grooming_date, :string
  end
end
