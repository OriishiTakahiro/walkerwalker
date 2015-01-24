json.array!(@qrevents) do |qrevent|
  json.extract! qrevent, :id, :code, :reward
  json.url qrevent_url(qrevent, format: :json)
end
