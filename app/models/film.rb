class Film < ApplicationRecord
  before_save { self.title = title.titleize }
  before_save { self.director = director.titleize }
  has_many :articles
  belongs_to :user
  validates :title, presence: true, uniqueness: { case_sensitive: false, message: ": Film già presente nella lista. Trovalo e aggiungi il tuo commento." }
  validates :director, presence: true
  validates :genre, presence: true
  validates :year, presence: true, length: { is: 4 }

  def self.search(search)
    if search
      where(["title LIKE ?","%#{search}%"])
    else
      all
    end
  end

end
