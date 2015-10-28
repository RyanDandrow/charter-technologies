class AddDateOfBirthToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :date_of_birth, :string
  end
end
