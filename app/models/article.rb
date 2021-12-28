class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum:5, maximum:100}, uniqueness: true
  validates :description, presence: true, length: {minimum:5, maximum:500}
end