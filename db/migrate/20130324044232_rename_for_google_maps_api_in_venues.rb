class RenameForGoogleMapsApiInVenues < ActiveRecord::Migration
  def change
    change_table :venues do |t|
      t.rename :street, :address
      t.remove :city, :state
      t.string :vicinity
    end
  end
end
