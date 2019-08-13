class AddAppFieldToDonationForms < ActiveRecord::Migration[5.2]
  def change
    add_column :donation_forms, :app, :integer
  end
end
