class CreateGadgetImages < ActiveRecord::Migration
  def change
    create_table :gadget_images do |t|
      t.references :gadget
      t.string :image
      t.timestamps
    end
    add_index :gadget_images, :gadget_id
  end
end
