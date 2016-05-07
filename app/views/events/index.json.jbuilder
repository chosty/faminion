json.array!(@events) do |event|
  json.extract! event, :id, :family_id, :name, :scheduled_at
  json.users event.users, :id, :name
  json.url event_url(event, format: :json)
end
