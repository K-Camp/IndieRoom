class AddIsPublicToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_public, :boolean, default: true, null: false
  end
end
