class DropFormsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :forms do |t|
      t.string :name
      t.string :url
      t.references :user
      t.foreign_key :user
      t.timestamps null: false
    end
  end
end