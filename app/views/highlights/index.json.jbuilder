json.array!(@highlights) do |highlight|
  json.extract! highlight, :id
  json.url highlight_url(highlight, format: :json)
end
