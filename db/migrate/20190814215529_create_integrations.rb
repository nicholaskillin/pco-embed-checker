class CreateIntegrations < ActiveRecord::Migration[5.2]
  def change
    create_table :integrations do |t|
      t.string :name
      t.text :data
      t.string :app
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
