class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.integer :user_id
      t.datetime :departure_time
      t.integer :capacity

      t.timestamps
    end
  end
end
