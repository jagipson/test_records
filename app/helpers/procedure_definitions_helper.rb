module ProcedureDefinitionsHelper

  def procedure_definition_old_version_column(record)
    if record.old_version.nil?
      return ""
    end
    
  end
end
