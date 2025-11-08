class ChangeDefaultInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :role, from: nil, to: 0
    change_column_default :users, :is_active, from: nil, to: true
  end
end
