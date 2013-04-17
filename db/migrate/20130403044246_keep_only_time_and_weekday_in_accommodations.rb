class KeepOnlyTimeAndWeekdayInAccommodations < ActiveRecord::Migration
  def up
    change_column :accommodations, :leaving_at, :time
    change_column :accommodations, :returning_at, :time
    add_column :accommodations, :weekday, :integer
  end

  def down
    change_column :accommodations, :leaving_at, :datetime
    change_column :accommodations, :returning_at, :datetime
    remove_column :accommodations, :weekday
  end
end
