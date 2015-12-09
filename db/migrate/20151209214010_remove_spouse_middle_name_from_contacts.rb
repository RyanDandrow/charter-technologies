class RemoveSpouseMiddleNameFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :spouse_middle_name, :string
  end
end
