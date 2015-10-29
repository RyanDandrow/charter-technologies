class AddCountyBox3ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :county_box3, :string
  end
end
