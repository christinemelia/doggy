class AddGroomingDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :grooming_date, :date
  end
end
