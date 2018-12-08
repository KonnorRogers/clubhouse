# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember

  validates :name, presence: true
  validates :email, presence: true
  ## Will not be fully validating w/ email regexp etc

  has_secure_password # uses bcrypt

  def self.create_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def remember
    self.remember_token = User.create_token
    self.remember_digest = User.digest(remember_token)
    # CANNOT UPDATE ATTRIBUTE IN A BEFORE_CREATE
  end
end
