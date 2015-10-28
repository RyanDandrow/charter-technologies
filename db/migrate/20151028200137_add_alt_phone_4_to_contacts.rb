class AddAltPhone4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_4, :string
  end
end
