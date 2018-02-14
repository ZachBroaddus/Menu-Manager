class User < ApplicationRecord
  has_secure_password

  validates :first_name, :email, :role, presence: true
  validates_length_of :password, minimum: 8, allow_nil: true

  validates_uniqueness_of :email
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_many :orders

  def formatted_name
    self.first_name.downcase.capitalize
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
