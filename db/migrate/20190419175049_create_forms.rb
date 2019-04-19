class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
