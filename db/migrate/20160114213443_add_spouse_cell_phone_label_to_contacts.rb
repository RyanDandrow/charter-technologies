class AddSpouseCellPhoneLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_cell_phone_label, :string
  end
end
