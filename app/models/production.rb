class Production < ActiveRecord::Base
  belongs_to :finishgood
  has_many :productiondetails
  
  accepts_nested_attributes_for :productiondetails
  attr_accessible :fg_ukey, :plannedtime, :downtime, :staff, :scrap
  
  
end
