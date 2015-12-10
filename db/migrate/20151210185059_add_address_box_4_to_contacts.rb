class AddAddressBox4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_4, :text
  end
end
