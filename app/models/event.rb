class Event < ActiveRecord::Base
  belongs_to :family

  has_many :event_target_users
  has_many :event_posts
  has_many :users, through: :event_target_users

  #scope :my_family_events, ->(user_id){ where(user_id: User.where(id: User.find(user_id))) }
end
