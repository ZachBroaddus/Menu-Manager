class OrderItem < ApplicationRecord
  validates :order_id, :item_id, :quantity, presence: true

  belongs_to :order
  belongs_to :item
end
