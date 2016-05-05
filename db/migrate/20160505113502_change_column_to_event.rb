class ChangeColumnToEvent < ActiveRecord::Migration
  def change
    remove_column :events, :user_id

    add_column :events, :name, :string
  end
end
