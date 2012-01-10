class ProcedureDefinition < ActiveRecord::Base
  validates :name, :presence => true
end
