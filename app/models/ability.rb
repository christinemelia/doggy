class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user(not logged in or signed up)

        if user.role? :Admin
          can :manage, :all
          
          elsif user.role? :Groomer
              can :manage, :all
              
              elsif user.role? :Customer
                
          can [:show, :index, :edit, :create, :update, :destroy], [Cart]
          can [:show, :index, :edit, :create, :update], [Location]
          can [:show, :index, :create, :edit, :update], [LineItem]
          can [:show, :index,], [Product]
          can [:edit, :create, :update],[Order]
          cannot [:index, :show], [User]
          can [:edit ,:create,:destroy], [User]
         
          
          
    
      #  elsif user.role? :Customer
       #   can :manage, :all
          
        end
      end 
    end 
    
    
    
    
   # can [:edit :create :update :destroy], Cart
   # can [:edit :create :update :destroy], Locations
    #can [:edit :create :update :destroy], Line_Items
   # can [:edit :create :update :destroy], Locations
   # can [:edit :create :update :destroy], Orders
   # can [:edit :create :update :destroy], Products
    #can [:edit :create :update :destroy], Sessions
   # can [:edit :create :update :destroy], Uers
    
          
          
          
       # elsif user.role? :Groomer
        #  can :manage, :[Application,Locations,Carts,Store,Orders]
          
          
         # [Products, Location, Cart, Store, Order]
      #  elsif user.role? :Customer
         # can :manage, :all
        #  can :create,:[Cart, Orders, Locations]
        #  can :read,:[Products, Locations, Carts, Application]
        #else 
         # can :update,[Cart, Location]
   # end
# end
#end
              


 





    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

