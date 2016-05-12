# coding: utf-8
class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :family

  has_many :event_target_users
  has_many :event_posts
  has_many :posts
  has_many :post_favs
  has_many :events, through: :event_target_users

  has_one :user_icon
  #has_one :device_code

  GENDER_ARRAY = ['その他', '男性', '女性']
  ROLE_ARRAY = ['その他', '父', '母', '息子', '娘', '祖父', '祖母']

  #スコープ
  #scope :my_family_users, ->(user_id){ where(family_id: Family.where(id: User.find(user_id).family_id)) }

  #自分の家族のUserのみを取得する
  def family_users
    #User.my_family_users(self.id).all
    User.where(family_id: self.family_id).all
  end

  #自分の家族のみを取得する
  def my_family
    Family.find(self.family_id)
  end

  #自分の家族関連のPostのみを取得する
  def family_posts
    Post.where(family_id: self.family_id).all
  end

  #自分の家族関連のEventのみを取得する
  def family_events
    Event.where(family_id: self.family_id).all
  end

  def gender_name
    GENDER_ARRAY[gender]
  end

  def role_name
    ROLE_ARRAY[role]
  end

  def session_json
    {id: id, email: email, access_token: access_token}.to_json
  end

  #ログイン時にアクセストークン生成、DB更新
  def login_by_api
    self.access_token = SecureRandom.hex(16)
    self.save
  end

end
