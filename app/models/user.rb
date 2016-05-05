class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :family

  has_many :event_target_users
  has_many :event_posts
  has_many :posts
  has_many :post_favs
  has_many :events, through: :event_target_users
end
