class Productionreason < ActiveRecord::Base
  has_many :productiondetails
  
  attr_accessible :description, :mc_id, :seq
  
  scope :productionreason_mc, lambda {|fg|
    where("mc_id = ?", fg.mc_id)
  }
  
  scope :productionreason_default, lambda {
    where("mc_id IS NULL")
  }
end
