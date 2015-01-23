json.array!(@users) do |user|
  json.extract! user, :id, :name, :pass, :userhash
  json.url user_url(user, format: :json)
end
