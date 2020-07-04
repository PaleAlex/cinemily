class AddFilmIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :film_id, :int   
  end
end
