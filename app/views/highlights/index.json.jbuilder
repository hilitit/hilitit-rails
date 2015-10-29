json.array!(@highlights) do |highlight|
  json.extract! highlight, :id
  json.extract! highlight, :start_offset
  json.extract! highlight, :end_offset
  json.extract! highlight, :selector
  json.extract! highlight, :user_id
  json.url highlight_url(highlight, format: :json)
end
