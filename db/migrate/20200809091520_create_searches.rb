class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :title
      t.string :director
      t.string :genre
      t.integer :min_year
      t.integer :max_year

      t.timestamps
    end
  end
end
