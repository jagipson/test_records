class ProcedureDefinitionsController < ApplicationController
  active_scaffold :procedure_definition do |conf|
    conf.update.columns.exclude :new_version, :old_version
    conf.update.refresh_list = true

    conf.create.columns.exclude :new_version, :old_version
    conf.update.refresh_list = true

    conf.columns[:old_version].actions_for_association_links = [:show]
    conf.columns[:new_version].actions_for_association_links = [:show]
  end

  # Add condition to hide old versions
  def conditions_for_collection
    if params[:show_old]
      return ""
    else
      return 'new_version_id IS NULL'
    end
  end

end 
