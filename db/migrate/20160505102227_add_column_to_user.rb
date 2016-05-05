class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :family_id, :integer
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :role, :string

    add_index :users, :family_id
  end
end
