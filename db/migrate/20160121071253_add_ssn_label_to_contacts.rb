class AddSsnLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :ssn_label, :string
  end
end
