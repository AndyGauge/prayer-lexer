json.array!(@topics) do |topic|
  json.extract! topic, :id, :slug
  json.url topic_url(topic, format: :json)
end
