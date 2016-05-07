class AddContentTypeToUserIcon < ActiveRecord::Migration
  def change
    add_column :user_icons, :content_type, :string
  end
end
