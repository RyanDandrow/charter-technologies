class AddDlStateSelectToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :dl_state_select, :string
  end
end
