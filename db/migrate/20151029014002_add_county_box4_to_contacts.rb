class AddCountyBox4ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :county_box4, :string
  end
end
