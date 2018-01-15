class Order < ApplicationRecord
  validates :user_id, :status, :tip_multiplier, presence: true

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items, dependent: :destroy

  def total
    order_total = self.order_items.reduce(0) do |sum, order_item|
      sum + order_item.item.price * order_item.quantity
    end
  end

  def tip
    order_tip = self.total * self.tip_multiplier
  end

  def total_with_tip
    self.total + self.tip
  end

end
