class ChangeIntegrationsToEmbeds < ActiveRecord::Migration[5.2]
  def change
    rename_table :integrations, :embeds
  end
end
