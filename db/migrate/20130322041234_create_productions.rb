class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.integer :plannedtime
      t.string :staff
      t.string :fg_ukey

      t.timestamps
    end
  end
end
