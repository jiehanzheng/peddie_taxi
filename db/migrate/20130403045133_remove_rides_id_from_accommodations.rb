class RemoveRidesIdFromAccommodations < ActiveRecord::Migration
  def change
    remove_column :accommodations, :rides_id, :integer
  end
end
