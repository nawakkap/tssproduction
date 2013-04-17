class Machineinfo < ActiveRecord::Base
  establish_connection "tssapp"
  
  set_table_name "mc_machine_info"
  set_primary_keys :mc_id
  
  attr_accessible :mc_id, :name, :status, :type
  
  alias_attribute :mc_id, :mc_id
  alias_attribute :name, :machine_name
  alias_attribute :type, :machine_type
  alias_attribute :status, :status
end
