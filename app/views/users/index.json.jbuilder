json.array!(@users) do |user|
  json.extract! user, :id, :family_id, :name, :birthday, :gender, :role, :email, :icon
  json.url user_url(user, format: :json)
end
