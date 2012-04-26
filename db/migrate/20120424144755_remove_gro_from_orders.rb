class RemoveGroFromOrders < ActiveRecord::Migration


  def down
    add_column :orders, :grooming_date, :string
  end
end
