class AddSpouseDlStateSelectToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_dl_state_select, :string
  end
end
