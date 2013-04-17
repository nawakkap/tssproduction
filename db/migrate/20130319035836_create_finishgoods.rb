class CreateFinishgoods < ActiveRecord::Migration
  def change
    create_table :finishgoods do |t|
      t.string :displaydate
      t.integer :unita
      t.integer :unita2
      t.integer :unitb
      t.integer :unitc
      t.integer :unitd
      t.date :procdate
      t.string :extprogcode
      t.string :prodname
      t.string :mach

      t.timestamps
    end
  end
end
