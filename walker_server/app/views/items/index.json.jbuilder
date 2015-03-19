json.array!(@items) do |item|
  json.extract! item, :id, :name, :effective_term, :effective_value, :description
  json.url item_url(item, format: :json)
end
