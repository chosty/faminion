json.array!(@event_posts) do |event_post|
  json.extract! event_post, :id, :event_id, :user_id, :content
  json.url event_post_url(event_post, format: :json)
end
