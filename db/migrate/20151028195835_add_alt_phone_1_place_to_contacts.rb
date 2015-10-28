class AddAltPhone1PlaceToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_phone_1_place, :string
  end
end
