json.array!(@logs) do |log|
  json.extract! log, :id, :field_id, :user_id, :message
  json.url log_url(log, format: :json)
end
