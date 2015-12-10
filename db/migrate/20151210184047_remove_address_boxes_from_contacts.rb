class RemoveAddressBoxesFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :companyNameBox1, :string
    remove_column :contacts, :contactNamesBox2, :string
    remove_column :contacts, :additionalAddressBox3, :string
    remove_column :contacts, :additionalAddressBox4, :string
    remove_column :contacts, :addressLinesBox1, :text
    remove_column :contacts, :addressLinesBox2, :text
    remove_column :contacts, :addressLinesBox3, :text
    remove_column :contacts, :addressLinesBox4, :text
  end
end
