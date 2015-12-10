class AddAddressBox4LabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_box_4_label, :string
  end
end
