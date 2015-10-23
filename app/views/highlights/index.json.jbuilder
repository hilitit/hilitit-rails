json.array!(@highlights) do |highlight|
  json.extract! highlight, :id
  json.extract! highlight, :start_offset
  json.extract! highlight, :end_offset
  json.url highlight_url(highlight, format: :json)
end
