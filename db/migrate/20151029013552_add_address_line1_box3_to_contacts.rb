class AddAddressLine1Box3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line1_box3, :string
  end
end
