class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :family, index: true, foreign_key: true
      t.references :user
      t.datetime :scheduled_at

      t.timestamps null: false
    end
  end
end
