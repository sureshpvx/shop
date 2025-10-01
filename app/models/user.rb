class User < ApplicationRecord
  has_secure_password

  # Basic validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
 # Validates that the password is at least 6 characters long, but only if creating a new user or if a password is being set/changed
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
