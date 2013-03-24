class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :school_role
      t.string :graduation_year
      t.string :site_role
      t.string :email

      t.timestamps
    end
  end
end
