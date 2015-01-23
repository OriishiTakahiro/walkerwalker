json.array!(@items) do |item|
  json.extract! item, :id, :name, :classification, :description
  json.url item_url(item, format: :json)
end
