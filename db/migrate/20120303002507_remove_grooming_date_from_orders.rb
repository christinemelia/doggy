class RemoveGroomingDateFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :grooming_date
  end

  def down
    add_column :orders, :grooming_date, :date
  end
end
