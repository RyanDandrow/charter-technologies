class AddAddressLinesBox3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :addressLinesBox3, :text
  end
end
