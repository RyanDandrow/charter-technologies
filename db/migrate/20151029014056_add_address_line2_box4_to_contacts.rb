class AddAddressLine2Box4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line2_box4, :string
  end
end
