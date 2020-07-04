class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title, :director, :genre
      t.integer :year
      t.timestamps
    end
  end
end
