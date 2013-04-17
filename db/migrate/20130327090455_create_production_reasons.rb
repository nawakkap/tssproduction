class CreateProductionReasons < ActiveRecord::Migration
  def change
    create_table :production_reasons do |t|
      t.string :mc_id
      t.integer :seq
      t.string :description

      t.timestamps
    end
  end
end
