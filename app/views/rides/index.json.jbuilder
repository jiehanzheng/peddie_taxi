json.array!(@rides) do |ride|
  json.extract! ride, :user_id, :leaving_at, :return_at
  json.url ride_url(ride, format: :json)
end