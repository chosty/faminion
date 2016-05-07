class CreateUserIcons < ActiveRecord::Migration
  def change
    create_table :user_icons do |t|
      t.references :user, index: true, foreign_key: true
      t.binary :icon

      t.timestamps null: false
    end
  end
end
