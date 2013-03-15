json.array!(@proposals) do |proposal|
  json.extract! proposal, :user_id, :venue_id, :comments, :leaving_at, :return_at
  json.url proposal_url(proposal, format: :json)
end