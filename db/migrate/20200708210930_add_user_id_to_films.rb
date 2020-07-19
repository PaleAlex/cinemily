class AddUserIdToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :user_id, :int
  end
end
