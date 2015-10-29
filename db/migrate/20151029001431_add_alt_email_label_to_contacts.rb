class AddAltEmailLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_email_label, :string
  end
end
