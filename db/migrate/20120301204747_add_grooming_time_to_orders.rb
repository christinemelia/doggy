class AddGroomingTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :grooming_time, :time
  end
end
