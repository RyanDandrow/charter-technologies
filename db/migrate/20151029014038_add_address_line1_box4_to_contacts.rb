class AddAddressLine1Box4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line1_box4, :string
  end
end
