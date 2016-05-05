json.array!(@users) do |user|
  json.extract! user, :id, :familiy_id, :name, :birthday, :gender, :role, :email
  json.url user_url(user, format: :json)
end
