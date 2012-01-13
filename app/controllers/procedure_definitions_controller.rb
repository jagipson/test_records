class ProcedureDefinitionsController < ApplicationController
  active_scaffold :procedure_definition do |conf|
    conf.actions.exclude :update  
    
    conf.create.columns.exclude :new_version


  end
end 
