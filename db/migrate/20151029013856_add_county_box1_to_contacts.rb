class AddCountyBox1ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :county_box1, :string
  end
end
