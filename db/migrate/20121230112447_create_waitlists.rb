class CreateWaitlists < ActiveRecord::Migration
  def change
    create_table :waitlists do |t|
      t.integer :user_id
      t.integer :accommodation_id

      t.timestamps
    end
  end
end
