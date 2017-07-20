class Order < ApplicationRecord
  belongs_to :client
  has_many :order_products
  has_and_belongs_to_many :products
end
