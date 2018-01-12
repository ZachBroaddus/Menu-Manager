class User < ApplicationRecord
  has_secure_password

  has_many :orders
  before_save :set_user_role

  private
  def set_user_role
    self.role = "user"
  end
end
