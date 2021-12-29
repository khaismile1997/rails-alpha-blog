# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :username, length: {minimum: 3, maximum: 25}, if: :username?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :email, length: {maximum: 105},
                    format: {with: VALID_EMAIL_REGEX}, if: :email?
end
