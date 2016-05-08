json.array!(@posts) do |post|
  json.extract! post, :id, :family_id, :user_id, :reply_post_id, :post_favs_count, :content, :post_picture_ids
  json.users post.user, :id, :name
  json.url post_url(post, format: :json)
end
