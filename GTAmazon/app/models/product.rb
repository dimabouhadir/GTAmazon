class Product < ApplicationRecord
  belongs_to :manufacturer
  has_many :order_products
  has_many :orders, through: :order_products
end
