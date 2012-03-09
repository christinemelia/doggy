class AddGroomingtimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :grooming_time, :string
  end
end
