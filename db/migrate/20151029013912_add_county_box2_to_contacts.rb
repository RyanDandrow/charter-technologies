class AddCountyBox2ToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :county_box2, :string
  end
end
