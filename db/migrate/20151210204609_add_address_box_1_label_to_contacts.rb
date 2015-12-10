class AddAddressBox1LabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_1_label, :string
  end
end
