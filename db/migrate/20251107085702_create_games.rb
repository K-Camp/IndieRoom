class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :genre_id,     null: false, foreign_key: true
      t.string  :game_name,    null: false
      t.text    :synopsis,     null: false
      t.date    :release_date, null: false
      t.timestamps
    end
  end
end
