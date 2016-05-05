json.array!(@posts) do |post|
  json.extract! post, :id, :family_id, :user_id, :reply_post_id, :favcount, :content
  json.url post_url(post, format: :json)
end
