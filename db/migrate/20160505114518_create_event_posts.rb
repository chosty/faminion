class CreateEventPosts < ActiveRecord::Migration
  def change
    create_table :event_posts do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
