class AddUserIdAndTimeAndCapacityToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :user_id, :integer
    add_column :accommodations, :leaving_at, :datetime
    add_column :accommodations, :returning_at, :datetime
    add_column :accommodations, :capacity, :integer
  end
end
