class DropDonationFormsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :donation_forms do |t|
      t.string :name
      t.string :url
      t.integer :app
      t.references :user
      t.foreign_key :user
      t.timestamps null: false
    end
  end
end
