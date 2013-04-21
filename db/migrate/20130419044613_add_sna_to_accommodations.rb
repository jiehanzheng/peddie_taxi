class AddSnaToAccommodations < ActiveRecord::Migration
  def change
    add_column :accommodations, :sna, :boolean, :default => 0
  end
end
