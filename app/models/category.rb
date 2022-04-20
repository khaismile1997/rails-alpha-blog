# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25} # rubocop:disable Rails/UniqueValidationWithoutIndex
  has_many :article_categories
  has_many :articles, through: :article_categories
end
