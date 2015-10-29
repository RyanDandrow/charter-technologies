class AddSpouseEmailToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_email, :string
  end
end
