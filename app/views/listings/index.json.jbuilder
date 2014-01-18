json.array!(@listings) do |listing|
  json.extract! listing, :id, :video, :description
  json.url listing_url(listing, format: :json)
end
