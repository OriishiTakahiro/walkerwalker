json.array!(@items_users) do |items_user|
  json.extract! items_user, :id, :user_id, :item_id
  json.url items_user_url(items_user, format: :json)
end
