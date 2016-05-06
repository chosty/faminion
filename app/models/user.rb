class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :family

  has_many :event_target_users
  has_many :event_posts
  has_many :posts
  has_many :post_favs
  has_many :events, through: :event_target_users

  enum gender: { blank_gender: 0, male: 1, female: 2 }
  enum role: { blank_role: 0, father: 1, mother: 2, child: 3 }

  scope :my_families, ->(user_id){ where(family_id: Family.where(id: User.find(user_id).family_id)) }
end
