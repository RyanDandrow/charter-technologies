class AddDateOfBirthLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :date_of_birth_label, :string
  end
end
