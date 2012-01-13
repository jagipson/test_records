class AddDataFieldsToProcedureDefintions < ActiveRecord::Migration
  def change
    add_column :procedure_definitions, :version, :integer, :default => 0, :null => false
    add_column :procedure_definitions, :procedure, :text
    add_column :procedure_definitions, :new_version_id, :integer
  end
end
