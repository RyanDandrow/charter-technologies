class AddAltPhone3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_3, :string
  end
end
