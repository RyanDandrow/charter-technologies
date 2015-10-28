class AddSpouseDateOfBirthToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_date_of_birth, :string
  end
end
