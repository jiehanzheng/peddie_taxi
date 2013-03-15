class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.datetime :leaving_at
      t.datetime :return_at

      t.timestamps
    end
  end
end
