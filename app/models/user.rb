# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :articles, dependent: :destroy

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :username, length: {minimum: 3, maximum: 25}, if: :username?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :email, length: {maximum: 105},
                    format: {with: VALID_EMAIL_REGEX}, if: :email?

  has_secure_password
end
