class AddAddressLine3Box3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line3_box3, :string
  end
end
