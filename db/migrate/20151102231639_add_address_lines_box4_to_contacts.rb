class AddAddressLinesBox4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :addressLinesBox4, :text
  end
end
