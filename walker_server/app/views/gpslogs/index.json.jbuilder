json.array!(@gpslogs) do |gpslog|
  json.extract! gpslog, :id, :userhash, :longitude, :latitude
  json.url gpslog_url(gpslog, format: :json)
end
