class ChangeColumnToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :fav_count, :post_favs_count
  end
end
