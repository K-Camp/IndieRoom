class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,    null: false, foreign_key: true
      t.integer :game_id,    null: false, foreign_key: true
      t.integer :score,      null: false
      t.string  :post_title, null: false
      t.text    :content,    null: false
      t.timestamps
    end
  end
end
