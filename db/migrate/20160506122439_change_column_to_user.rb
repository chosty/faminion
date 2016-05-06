class ChangeColumnToUser < ActiveRecord::Migration
  def change
    change_column :users, :gender, :integer, default: 0, null: false
    change_column :users, :role, :integer, default: 0, null: false
  end
end
