class Productiondetail < ActiveRecord::Base
  belongs_to :production
  belongs_to :productionreason
  
  attr_accessible :production_id, :productionreason_id, :time, :remark
  
  def slot_time
    self.time.to_i/5
  end
end
