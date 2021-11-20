class Search < ApplicationRecord

  def search_films

    films = Film.all.order(created_at: :desc)

    films = films.where(["title LIKE ?","%#{title}%"]).order(created_at: :desc) if title.present?
    films = films.where(["genre LIKE ?", "%#{genre}%"]).order(created_at: :desc) if genre.present?
    films = films.where(["year >= ?", min_year]).order(created_at: :desc).order(created_at: :desc) if min_year.present?
    films = films.where(["year <= ?", max_year]).order(created_at: :desc) if max_year.present?
    films = films.where(["director LIKE ?", "%#{director}%"]).order(created_at: :desc) if director.present?

    return films
  end


end
