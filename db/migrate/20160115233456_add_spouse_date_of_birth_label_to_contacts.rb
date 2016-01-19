class AddSpouseDateOfBirthLabelToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_date_of_birth_label, :string
  end
end
