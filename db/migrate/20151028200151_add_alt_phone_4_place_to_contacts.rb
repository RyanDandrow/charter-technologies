class AddAltPhone4PlaceToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_4_place, :string
  end
end
