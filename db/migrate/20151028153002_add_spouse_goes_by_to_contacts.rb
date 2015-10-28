class AddSpouseGoesByToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_goes_by, :string
  end
end
