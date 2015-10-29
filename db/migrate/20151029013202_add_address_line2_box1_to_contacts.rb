class AddAddressLine2Box1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_line2_box1, :string
  end
end
