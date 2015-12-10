class AddAddressBox3LabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_3_label, :string
  end
end
