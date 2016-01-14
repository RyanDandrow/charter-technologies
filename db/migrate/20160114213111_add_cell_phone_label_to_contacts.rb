class AddCellPhoneLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :cell_phone_label, :string
  end
end
