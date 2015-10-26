class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :company
    	t.string :goes_by
    	t.string :cell_phone
    	t.string :sf_id
    	t.text :additional_info

    	t.timestamps
    end
  end
end
