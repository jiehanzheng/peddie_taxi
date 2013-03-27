class DropRides < ActiveRecord::Migration
  def up
    drop_table :rides
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "When it's gone, it's gone"
  end
end
