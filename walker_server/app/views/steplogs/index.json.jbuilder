json.array!(@steplogs) do |steplog|
  json.extract! steplog, :id, :userhash, :step
  json.url steplog_url(steplog, format: :json)
end
