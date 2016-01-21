class AddSpouseSsnLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_ssn_label, :string
  end
end
