class RenameWeekdayToDayOfWeekInAccommodations < ActiveRecord::Migration
  def change
    rename_column :accommodations, :weekday, :day_of_week
  end
end
