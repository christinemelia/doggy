
class User < ActiveRecord::Base
  
has_and_belongs_to_many :roles
#belongs_to :role
       
    
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :recoverable, :trackable, :validatable
  #, :recoverable, :trackable, :validatable
         
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email,:password, :password_confirmation, :remember_me, :role_ids, :roles

 
  
 
 # def role?(role)
 #      return !!self.roles.find_by_name(role.to_s.camelize)
  #end

  def role?(role)
     return !!self.roles.find_by_name(role.to_s)
   end
   
   
   
   before_create :setup_role
   private
   def setup_role
     if self.role_ids.empty?
       self.role_ids = [3]
     end
   end
   
  
 
#validates :name, presence: true, uniqueness: true
#has_secure_password

after_destroy :ensure_an_Admin_remains



#def add_provider(auth_hash)
  # Check if the provider already exists, so we don't add it twice
 # unless authentications.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    # Authentication.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
 # end
#end


  private
    def ensure_an_Admin_remains
        if User.count.zero?
          raise "Can't delete last user"
    end
end
end


