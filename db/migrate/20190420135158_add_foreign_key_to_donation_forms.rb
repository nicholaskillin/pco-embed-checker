class AddForeignKeyToDonationForms < ActiveRecord::Migration[5.2]
  def change
    add_reference :donation_forms, :user, foreign_key: true
  end
end
