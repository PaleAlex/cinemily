class Article < ApplicationRecord
  belongs_to :film
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :description, presence: true, length: { minimum: 100, maximum: 5000 }
end
