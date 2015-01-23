json.array!(@gpsquests) do |gpsquest|
  json.extract! gpsquest, :id, :destination, :longitude, :latitude, :reward
  json.url gpsquest_url(gpsquest, format: :json)
end
