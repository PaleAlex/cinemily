class User < ApplicationRecord

  has_many :articles
  has_many :likes, dependent: :destroy
  has_many :films

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 15}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}
end
