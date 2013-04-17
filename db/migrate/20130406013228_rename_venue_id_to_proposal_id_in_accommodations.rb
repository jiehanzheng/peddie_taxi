class RenameVenueIdToProposalIdInAccommodations < ActiveRecord::Migration
  def change
    rename_column :accommodations, :venue_id, :proposal_id
  end
end
