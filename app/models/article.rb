class Article < ApplicationRecord
  belongs_to :film
  validates :description, presence: true, length: { minimum: 100, maximum: 5000 }
end
