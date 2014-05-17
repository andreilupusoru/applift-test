class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.references :user
      t.string :name
      t.text :description
      t.timestamps
    end
    add_index :gadgets, :user_id
  end
end
