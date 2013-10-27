json.array!(@location_ownerships) do |location_ownership|
  json.extract! location_ownership, :location_id, :user_id, :start, :end, :prolonged
  json.url location_ownership_url(location_ownership, format: :json)
end
