class AddAddressBox2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_2, :text
  end
end
