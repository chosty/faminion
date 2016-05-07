json.extract! @post, :id, :family_id, :user_id, :reply_post_id, :post_favs_count, :content, :created_at, :updated_at
json.user @post.user, :id, :name
