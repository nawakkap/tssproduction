class AddRemarkColumnToProductiondetails < ActiveRecord::Migration
  def change
    add_column :productiondetails, :remark, :string
  end
end
