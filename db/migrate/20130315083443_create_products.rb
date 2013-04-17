class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :id
      t.string :displayid
      t.string :nameeng
      t.string :nameth
      t.string :nameinit
      t.string :size
      t.string :thmin
      t.string :threp
      t.string :film
      t.float :estw
      t.float :wmin
      t.float :wmax
      t.float :acctw
      t.integer :pcspack
      t.integer :pcstruck
      t.float :wagekg
      t.string :wdisplay
      t.string :inprod
      t.float :pct
      t.string :vat

      t.timestamps
    end
  end
end
