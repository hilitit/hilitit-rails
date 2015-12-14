json.array!(@highlights) do |highlight|
  json.extract! highlight, :id
  json.extract! highlight, :text
  json.extract! highlight, :user_id
  json.url highlight_url(highlight, format: :json)
end
