class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string  :title
      t.text    :body
      t.date    :release_date
      t.timestamps
    end
  end
end
