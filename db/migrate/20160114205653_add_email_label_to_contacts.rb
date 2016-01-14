class AddEmailLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :email_label, :string
  end
end
