class AddAddressBox3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_3, :text
  end
end
