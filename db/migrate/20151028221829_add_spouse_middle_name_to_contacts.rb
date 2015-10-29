class AddSpouseMiddleNameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_middle_name, :string
  end
end
