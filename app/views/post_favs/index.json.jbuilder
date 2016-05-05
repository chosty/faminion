json.array!(@post_favs) do |post_fav|
  json.extract! post_fav, :id, :post_id, :user_id
  json.url post_fav_url(post_fav, format: :json)
end
