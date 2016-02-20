class AddSpouseNameLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_name_label, :string
  end
end
