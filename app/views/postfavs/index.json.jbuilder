json.array!(@postfavs) do |postfav|
  json.extract! postfav, :id, :post_id, :user_id
  json.url postfav_url(postfav, format: :json)
end
