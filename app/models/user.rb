class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {minimum: 4, maximum: 60}
  VALID_EMAIL_REGEX = /\A[a-zA-Z]+\.+[a-zA-Z]+@rmit\.edu\.au\z/i
  validates :email, presence: true, length: {minimum: 4, maximum: 255 }, 
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /\A(?:[0-9]+[a-z]|[a-z]+[0-9])[a-z0-9]*\z/i
  validates :password, presence: true, length: { minimum: 6 }, 
  format: { with: VALID_PASSWORD_REGEX }
  has_secure_password
end
