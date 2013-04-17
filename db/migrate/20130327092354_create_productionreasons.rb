class CreateProductionreasons < ActiveRecord::Migration
  def change
    create_table :productionreasons do |t|
      t.string :mc_id
      t.integer :seq
      t.string :description

      t.timestamps
    end
  end
end
