class AddAltPhone1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_1, :string
  end
end
