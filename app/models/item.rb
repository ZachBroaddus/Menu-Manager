class Item < ApplicationRecord
  validates :name, :category, :price, :description, presence: true
  validates_uniqueness_of :name
  has_attached_file :image, styles: { large: "400x400>", medium: "200x200>", thumb: "100x100>" }, default_url: "https://s3-us-west-1.amazonaws.com/menu-manager-pro/items/images/default-cat.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy
end

