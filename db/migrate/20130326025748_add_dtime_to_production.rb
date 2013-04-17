class AddDtimeToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :downtime, :integer
  end
end
