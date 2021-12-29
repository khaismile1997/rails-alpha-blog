# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
end
