class StoreWeekAndYearForProposals < ActiveRecord::Migration
  def change
    change_table :proposals do |t|
      t.remove :leaving_at, :returning_at
      t.integer :year
      t.integer :week
      t.index :year
      t.index :week
    end
  end
end
