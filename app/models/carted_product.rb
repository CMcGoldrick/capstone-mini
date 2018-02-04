class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true
  # if you don't have this it will always look for order_id
  # CartedProduct has an order_id and a product_id. Therefore it belongs to order and belongs to product. 
end


 