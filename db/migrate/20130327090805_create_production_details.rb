class CreateProductionDetails < ActiveRecord::Migration
  def change
    create_table :production_details do |t|
      t.integer :production_reason_id
      t.integer :time
      t.string :production_ukey

      t.timestamps
    end
  end
end
