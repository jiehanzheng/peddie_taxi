json.array!(@accommodations) do |accommodation|
  json.extract! accommodation, :venue_id, :rides_id, :comments
  json.url accommodation_url(accommodation, format: :json)
end