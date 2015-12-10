class AddAddressBox2LabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_2_label, :string
  end
end
