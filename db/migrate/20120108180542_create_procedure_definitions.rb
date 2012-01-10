class CreateProcedureDefinitions < ActiveRecord::Migration
  def change
    create_table :procedure_definitions do |t|
      t.string :name

      t.timestamps
    end
  end
end
