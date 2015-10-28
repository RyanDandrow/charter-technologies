class AddSpouseCellPhoneToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_cell_phone, :string
  end
end
