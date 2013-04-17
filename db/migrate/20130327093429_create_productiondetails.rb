class CreateProductiondetails < ActiveRecord::Migration
  def change
    create_table :productiondetails do |t|
      t.integer :productionreason_id
      t.integer :time
      t.string :production_id

      t.timestamps
    end
  end
end
