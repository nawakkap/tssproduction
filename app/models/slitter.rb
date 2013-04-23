class Slitter < ActiveRecord::Base
  establish_connection "tssapp"
  
  set_table_name "vr_rpt_slit_perf"
  set_primary_keys :ukey
  
  has_one :production, :foreign_key => "fg_ukey"
  
  accepts_nested_attributes_for :production
  
  alias_attribute :slukey, :ukey
  alias_attribute :slitterdweight, :weight
  alias_attribute :slittedcoil, :coils
  alias_attribute :slitteddate, :display_date
  
  default_scope order("sortDate DESC, mach")
  
  scope :pastweek, lambda {
    where(:sortdate => 7.days.ago.beginning_of_day..Date.yesterday.end_of_day)
  }
  
  def sum_downtime
    self.production.productiondetails.sum(:time)
  end
  
  def pr_rate
    if self.production.plannedtime
      weight.to_f/self.production.plannedtime/thickness/0.0471/1224*6
    else
      ""
    end
  end
  
  def ut_rate
    if self.sum_downtime && self.production.plannedtime
      weight.to_f/(self.production.plannedtime - self.sum_downtime)/thickness/0.0471/1224*6
    else
      ""
    end
  end
  
  attr_accessible :mach, :slittedcoil, :slitteddate, :sortdate, :slitterdweight, :slukey, :thickness, :remark, :coil_group_code
end
