json.array!(@event_target_users) do |event_target_user|
  json.extract! event_target_user, :id, :event_id, :user_id
  json.url event_target_user_url(event_target_user, format: :json)
end
