class Post < ActiveRecord::Base
  belongs_to :family
  belongs_to :user
  belongs_to :reply_post, class_name: Post

  has_many :post_favs
  has_many :post_pictures

  #scope :my_family_posts, ->(user_id){ where(family_id: Family.where(id: User.find(user_id).family_id)) }

  def post_picture_ids()
    PostPicture.select(:id).where(post_id: self.id).all.inject([ ]) { | ids, item | ids << item["id"] }
  end

end
