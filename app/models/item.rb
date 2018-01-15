class Item < ApplicationRecord
  validates :name, :description, :category, :price, presence: true
  validates_uniqueness_of :name

  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy

end
