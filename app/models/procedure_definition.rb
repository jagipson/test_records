class ProcedureDefinition < ActiveRecord::Base
  validates :name, :presence => true
  validates :version, :presence => true
  
  has_one :old_version, :class_name => "ProcedureDefinition",
                           :foreign_key => "new_version_id"

  belongs_to :new_version, :class_name => "ProcedureDefinition" 
  
  attr_readonly :name, :version, :procedure, :new_version
end
