class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :description
      t.text :street
      t.text :city
      t.text :state

      t.timestamps
    end
  end
end
