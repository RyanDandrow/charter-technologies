class AddAddressLine3Box4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line3_box4, :string
  end
end
