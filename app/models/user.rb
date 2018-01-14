class User < ApplicationRecord
  has_secure_password

  has_many :orders
  before_save :set_user_role

  def formatted_name
    self.first_name.downcase.capitalize
  end

  private
  def set_user_role
    self.role = "user"
  end

end
