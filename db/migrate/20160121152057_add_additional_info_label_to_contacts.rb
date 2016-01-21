class AddAdditionalInfoLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :additional_info_label, :string
  end
end
