class AddSpouseSsnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :spouse_ssn, :string
  end
end
