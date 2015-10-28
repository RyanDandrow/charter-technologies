class AddAltPhone2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_2, :string
  end
end
