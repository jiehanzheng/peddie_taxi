class AddAggregationsSupportToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :street, :string
    add_column :venues, :city, :string
    remove_column :venues, :address
  end
end
