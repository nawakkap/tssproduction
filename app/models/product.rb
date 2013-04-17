class Product < ActiveRecord::Base  
  establish_connection "tssapp"
  
  set_table_name "prd_product_detail"
  set_primary_key "product_dtl_id"
  
  
  alias_attribute :id, :product_dtl_id
  alias_attribute :displayid, :product_display_id
  alias_attribute :nameeng, :product_name_en
  alias_attribute :nameth, :product_name_th
  alias_attribute :nameinit, :product_name_initial
  alias_attribute :size, :size_detail
  alias_attribute :thmin, :thickness_min
  alias_attribute :threp, :thickness_rep
  alias_attribute :film, :film_size
  alias_attribute :estw, :est_weight
  alias_attribute :wmin, :est_weight_min
  alias_attribute :wmax, :actual_weight
  alias_attribute :acctw, :accounting_weight
  alias_attribute :pcspack, :piece_per_pack
  alias_attribute :pcstruck, :piece_per_truck
  alias_attribute :wagekg, :wage_per_kilo
  alias_attribute :wdisplay, :weight_display
  alias_attribute :inprod, :in_production
  alias_attribute :pct, :perct_of_films
  alias_attribute :vat, :default_vat

  default_scope order(:product_display_id)
  scope :inproduction, :conditions => {:in_production => "Y"}
  
  attr_accessible :acctw, :displayid, :estw, :film, :id, :inprod, :nameeng, :nameinit, :nameth, :pcspack, :pcstruck, :pct, :size, :thmin, :threp, :vat, :wagekg, :wdisplay, :wmax, :wmin
  
end
