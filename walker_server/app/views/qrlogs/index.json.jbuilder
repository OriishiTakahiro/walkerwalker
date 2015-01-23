json.array!(@qrlogs) do |qrlog|
  json.extract! qrlog, :id, :userhash, :code
  json.url qrlog_url(qrlog, format: :json)
end
