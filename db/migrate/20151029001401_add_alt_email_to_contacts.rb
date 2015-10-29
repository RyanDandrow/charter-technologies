class AddAltEmailToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_email, :string
  end
end
