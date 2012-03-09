class RemoveGroomingTimeFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :grooming_time
  end

  def down
    add_column :orders, :grooming_time, :time
  end
end
