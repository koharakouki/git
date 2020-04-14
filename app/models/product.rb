class Product < ApplicationRecord
	has_many :order_products
	has_many :carts
	belongs_to :genre
end
