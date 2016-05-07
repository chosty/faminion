class CreatePostPictures < ActiveRecord::Migration
  def change
    create_table :post_pictures do |t|
      t.references :post, index: true, foreign_key: true
      t.binary :picture

      t.timestamps null: false
    end
  end
end
