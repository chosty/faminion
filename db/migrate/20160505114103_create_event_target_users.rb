class CreateEventTargetUsers < ActiveRecord::Migration
  def change
    create_table :event_target_users do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
