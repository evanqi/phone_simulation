json.array!(@connections) do |connection|
  json.extract! connection, :id, :state, :incoming_url, :incoming_phone_num, :incoming_caller_id
  json.url connection_url(connection, format: :json)
end
