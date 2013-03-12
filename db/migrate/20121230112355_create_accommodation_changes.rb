class CreateAccommodationChanges < ActiveRecord::Migration
  def change
    create_table :accommodation_changes do |t|
      t.integer :user_id
      t.string :field
      t.text :old_value
      t.text :new_value

      t.timestamps
    end
  end
end
