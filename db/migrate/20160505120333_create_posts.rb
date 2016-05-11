class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :family, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      #t.references :reply_post, index: true, foreign_key: true
      t.integer :reply_post_id
      t.integer :fav_count
      t.string :content

      t.timestamps null: false
    end
  end
end
