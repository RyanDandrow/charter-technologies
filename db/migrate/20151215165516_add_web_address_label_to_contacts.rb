class AddWebAddressLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :web_address_label, :string
  end
end
