class AddAltPhone2PlaceToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_2_place, :string
  end
end
