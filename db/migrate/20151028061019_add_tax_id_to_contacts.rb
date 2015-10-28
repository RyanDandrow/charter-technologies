class AddTaxIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :tax_id, :string
  end
end
