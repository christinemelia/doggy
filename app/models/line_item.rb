
class LineItem < ActiveRecord::Base
   
belongs_to :order
belongs_to :product
belongs_to :cart


def total_price
product.price * quantity
end

end





# making associations belomginh to cart and products for line items dependency model in db belongs_to tells Rails that rows in the line_items table are children of rows in
#the carts and products tables. No line item can exist unless the corresponding
#cart and product rows exist