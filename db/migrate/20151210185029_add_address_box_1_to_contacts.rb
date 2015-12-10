class AddAddressBox1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_1, :text
  end
end
