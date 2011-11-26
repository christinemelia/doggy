class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end


# has many association used to depend line items with cart session 
# a cart has many associated line items. These are linked to the cart because each line item contains a reference to its cart’s id.
# add_product() method in my Cart, one that checks whether my list of items already includes the product im adding; if it does, it
# bumps the quantity, and if it doesn’t, it builds a new LineItem