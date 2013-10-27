json.array!(@locations) do |location|
  json.extract! location, :name, :latlong, :id, :location_ownership, :price
end
