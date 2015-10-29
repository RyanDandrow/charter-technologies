class AddAddressLine2Box3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line2_box3, :string
  end
end
