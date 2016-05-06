class Post < ActiveRecord::Base
  belongs_to :family
  belongs_to :user
  belongs_to :reply_post, class_name: Post

  has_many :post_favs
end
