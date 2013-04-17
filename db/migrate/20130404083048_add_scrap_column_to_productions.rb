class AddScrapColumnToProductions < ActiveRecord::Migration
  def change
    add_column :productions, :scrap, :integer
  end
end
