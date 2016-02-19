class CreateComps < ActiveRecord::Migration
  def change
    create_table :comps do |t|
      t.string :comp
      t.string :comp_type
      t.boolean :done
      t.belongs_to :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
