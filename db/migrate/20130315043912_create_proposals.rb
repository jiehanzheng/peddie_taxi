class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :user_id
      t.integer :venue_id
      t.text :comments
      t.datetime :leaving_at
      t.datetime :return_at

      t.timestamps
    end
  end
end
