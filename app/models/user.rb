
class User < ActiveRecord::Base
  
has_many :authentications

validates :name, presence: true, uniqueness: true
has_secure_password

after_destroy :ensure_an_admin_remains



def add_provider(auth_hash)
  # Check if the provider already exists, so we don't add it twice
  unless authentications.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    Authentication.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end
end


  private
    def ensure_an_admin_remains
        if User.count.zero?
          raise "Can't delete last user"
          end
      end
end


