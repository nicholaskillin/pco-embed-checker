class DropWidgetsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :widgets do |t|
      t.string :name
      t.text :code
      t.references :user
      t.foreign_key :user
      t.timestamps null: false
    end
  end
end
