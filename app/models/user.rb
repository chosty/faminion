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

  #スコープ
  #scope :my_family_users, ->(user_id){ where(family_id: Family.where(id: User.find(user_id).family_id)) }

  #自分の家族のUserのみを取得する
  def family_users
    #User.my_family_users(self.id).all
    User.where(family_id: self.family_id).all
  end

  #自分の家族関連のPostのみを取得する
  def family_posts
    Post.where(family_id: self.family_id).all
  end

  #自分の家族関連のEventのみを取得する
  def family_events
    Event.where(family_id: self.family_id).all
  end

end
