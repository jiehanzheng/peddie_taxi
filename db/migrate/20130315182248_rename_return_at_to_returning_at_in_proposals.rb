class RenameReturnAtToReturningAtInProposals < ActiveRecord::Migration
  def change
    rename_column :proposals, :return_at, :returning_at
  end
end
