class Item < ApplicationRecord
  validates :name, :description, :category, :price, presence: true

  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy
end
