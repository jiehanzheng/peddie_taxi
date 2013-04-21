class AddAccommodationIdToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :accommodation_id, :integer
  end
end
