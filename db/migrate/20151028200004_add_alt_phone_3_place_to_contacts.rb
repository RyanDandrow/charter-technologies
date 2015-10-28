class AddAltPhone3PlaceToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_3_place, :string
  end
end
