class Item < ApplicationRecord
  has_many :users, through: :carts
  has_many :orders
  has_many :carts, through: :orders
  has_many :users, through: :orders
end
