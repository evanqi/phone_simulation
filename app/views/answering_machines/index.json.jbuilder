json.array!(@answering_machines) do |answering_machine|
  json.extract! answering_machine, :id, :url
  json.url answering_machine_url(answering_machine, format: :json)
end
