class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :venue_id
      t.text :note
      t.text :departure_time_slots
      t.datetime :earliest_departure_time
      t.datetime :latest_departure_time
      t.integer :stay_duration
      t.integer :stay_duration_margin
      t.integer :accommodation_id
      t.text :resolution

      t.timestamps
    end
  end
end
