class AddWebAddressToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :web_address, :string
  end
end
