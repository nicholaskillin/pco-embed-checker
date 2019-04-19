class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :forms, :code, :url
  end
end
