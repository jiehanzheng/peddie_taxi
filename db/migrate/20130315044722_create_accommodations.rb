class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.integer :venue_id
      t.integer :rides_id
      t.text :comments

      t.timestamps
    end
  end
end
