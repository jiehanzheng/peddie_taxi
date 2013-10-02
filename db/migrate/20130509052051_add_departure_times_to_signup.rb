class AddDepartureTimesToSignup < ActiveRecord::Migration
  def change
    add_column :signups, :earliest_departure, :time
    add_column :signups, :latest_departure, :time
  end
end
