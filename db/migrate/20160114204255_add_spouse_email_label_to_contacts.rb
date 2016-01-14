class AddSpouseEmailLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_email_label, :string
  end
end
