class Slitter < ActiveRecord::Base
  establish_connection "tssapp"
  
  set_table_name "vr_rpt_actual_slit_by_date"
  set_primary_keys :ukey
  
  has_one :production, :foreign_key => "fg_ukey"
  
  accepts_nested_attributes_for :production
  
  alias_attribute :mach, :machine
  alias_attribute :slukey, :ukey
  alias_attribute :slitterdweight, :slittedweight
  
  default_scope order("sortDate DESC, machine")
  scope :pastweek, lambda {
    where(:sortDate => 7.days.ago.beginning_of_day..Date.yesterday.end_of_day)
  }
  
  attr_accessible :machine, :slittedcoil, :slitteddate, :sortdate, :slitterdweight, :slukey, :thickness
end
