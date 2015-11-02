class AddAddressLinesBox2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :addressLinesBox2, :text
  end
end
