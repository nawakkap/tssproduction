class Productionreason < ActiveRecord::Base
  has_many :productiondetails
  
  attr_accessible :description, :mc_id, :seq

  scope :productionreason_sl, where(:mc_id => 10)
  
  scope :productionreason_default, lambda {
    where("mc_id IS NULL")
  }
end
