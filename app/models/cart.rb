class Cart < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :items, through: :orders

  def total
    orders.to_a.sum { |order| order.total }
  end
end
