class Finishgood < ActiveRecord::Base
  establish_connection "tssapp"
  
  set_table_name "vr_rpt_finishgood_detail_ext"
  set_primary_keys :ukey
  
  has_one :production, :foreign_key => "fg_ukey"
  
  accepts_nested_attributes_for :production
  
  alias_attribute :displaydate, :dateProduced
  alias_attribute :extprogcode, :extProgramCode
  alias_attribute :mach, :machine
  alias_attribute :mc_id, :machine_id
  alias_attribute :procdate, :sortDate
  alias_attribute :prodname, :productName
  alias_attribute :prodid, :product_id
  alias_attribute :unita, :unit_a
  alias_attribute :unita2, :unit_a2
  alias_attribute :unitb, :unit_b
  alias_attribute :unitc, :unit_c
  alias_attribute :unitd, :unit_d
  
  attr_accessible :ukey, :displaydate, :extprogcode, :mach, :mc_id, :procdate, :prodname, :prodid, :unita, :unita2, :unitb, :unitc, :unitd
  
  default_scope order("sortDate DESC, machine")
  
  scope :pastweek, lambda {
    where(:sortDate => 7.days.ago.beginning_of_day..Date.yesterday.end_of_day)
  }
  
  scope :atdate, lambda {|proddate|
    where(:sortDate => Date.parse(proddate).beginning_of_day..Date.parse(proddate).end_of_day)
  }
  
  scope :betweendate, lambda {|proddate, proddate2|
    where(:sortDate => Date.parse(proddate).beginning_of_day..Date.parse(proddate2).end_of_day)
  }
  
  scope :yesterday, lambda {
    where(:sortDate => Date.yesterday.beginning_of_day..Date.yesterday.end_of_day)
  }
  
  def unit_total
      unita + unita2 + unitb + unitc + unitd
  end
  
  def b_unit_total
      unitb + unitc + unitd
  end
  
  def b_pct
    unitb.to_f/unit_total*100
  end
  
  def c_pct
    unitc.to_f/unit_total*100
  end
  
  def d_pct
    unitd.to_f/unit_total*100
  end
  
  def bcd_pct
    (unitb.to_f + unitc.to_f + unitd.to_f)/unit_total*100
  end
  
  def pr_rate
    if self.production.plannedtime
      unit_total.to_f/self.production.plannedtime
    else
      ""
    end
  end
  
  def ut_rate
    if self.sum_downtime && self.production.plannedtime
      unit_total.to_f/(self.production.plannedtime - self.sum_downtime)
    else
      ""
    end
  end
  
  def throughput1
    if self.sum_downtime && self.production.plannedtime
      (self.unita + self.unita2)*Product.find_by_product_dtl_id(self.prodid).estw/1000
    else
      ""
    end
  end
  
  def throughput2
    if self.sum_downtime && self.production.plannedtime
      (self.unita + self.unita2)*Product.find_by_product_dtl_id(self.prodid).estw/(self.production.plannedtime - self.sum_downtime)*self.production.plannedtime/1000
    else
      ""
    end
  end
  
  def scrap_rate
    if self.production.scrap && self.throughput1 && self.production.plannedtime
      self.production.scrap/self.throughput1/1000*100
    else
      ""
    end
  end
  
  def sum_downtime
    self.production.productiondetails.sum(:time)
  end
end
