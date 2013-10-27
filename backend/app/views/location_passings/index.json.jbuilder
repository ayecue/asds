json.array!(@location_passings) do |location_passing|
  json.extract! location_passing, :enter_point, :entered_at, :exit_point, :exited_at, :user, :location
  json.url location_passing_url(location_passing, format: :json)
end
