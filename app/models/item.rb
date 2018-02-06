class Item < ApplicationRecord
  validates :name, :category, :image_url, :price, :description, presence: true
  validates_uniqueness_of :name
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy
end

