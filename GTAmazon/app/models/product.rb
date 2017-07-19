class Product < ApplicationRecord
  belongs_to :manufacturer
  has_and_belongs_to_many :orders
end
