json.extract! @event, :id, :family_id, :name, :scheduled_at, :created_at, :updated_at
json.users @event.users, :id, :name
