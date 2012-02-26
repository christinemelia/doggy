class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :lastname
      t.text :address
      t.string :email
      t.string :pay_type
      t.string :ip_address
      t.string :card_type
      t.date :card_expires_on 
      

      t.timestamps
    end
  end
end
