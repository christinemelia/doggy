
class RoleUser < ActiveRecord::Migration
def self.up
	 create_table :roles_users, :id => false do |t|
	 t.column :role_id, :integer, :null => false
	 t.column :user_id, :integer, :null => false
	 end
end
	 def self.down
	   
	   drop_table :roles_users, :id => false do |t|
end
end
end 



