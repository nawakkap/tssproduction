class Staff < ActiveRecord::Base
  attr_accessible :name, :position
  
  scope :forming, where(:position => 'FR')
  scope :slitter, where(:position => 'SL')
end
