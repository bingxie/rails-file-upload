json.array!(@photos) do |photo|
  json.extract! photo, :id, :name, :album_id
  json.url photo_url(photo, format: :json)
end
