class ChangeColumnToUser < ActiveRecord::Migration
  def change
    remove_column :users, :gender
    add_column :users, :gender, :integer, default: 0, null: false
    remove_column :users, :role
    add_column :users, :role, :integer, default: 0, null: false
  end
end
