class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  ## Will not be fully validating w/ email regexp etc

  has_secure_password # uses bcrypt
end
