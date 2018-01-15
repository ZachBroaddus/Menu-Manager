class User < ApplicationRecord
  has_secure_password

  validates :first_name, :email, :role, presence: true
  validates_length_of :password, :minimum => 8
  validates_uniqueness_of :email
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_many :orders


  def formatted_name
    self.first_name.downcase.capitalize
  end

end
