json.array!(@voicemails) do |voicemail|
  json.extract! voicemail, :id, :audio, :connection_id, :created_at, :has_been_listened
  json.url voicemail_url(voicemail, format: :json)
end
