class Post < ActiveRecord::Base
  belongs_to :family
  belongs_to :user
  belongs_to :reply_post, class: :post

  has_many :post_favs
end
