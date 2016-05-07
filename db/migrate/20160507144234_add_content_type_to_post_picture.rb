class AddContentTypeToPostPicture < ActiveRecord::Migration
  def change
    add_column :post_pictures, :content_type, :string
  end
end
