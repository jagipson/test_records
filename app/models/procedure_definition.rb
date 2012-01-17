class ProcedureDefinition < ActiveRecord::Base
  validates :name, :presence => true
  validates :version, :presence => true

  before_destroy :check_is_latest_version
  
  has_one :old_version, :class_name => "ProcedureDefinition",
                           :foreign_key => "new_version_id"

  belongs_to :new_version, :class_name => "ProcedureDefinition" 

  attr_readonly :name, :version, :procedure

  # We want to override save to change what it does. before saving,
  # create a duplicate, save it instead, then update the new_version field
  # only. 
  def update
    new_version = ProcedureDefinition.new
    new_version.name = self.name
    new_version.version = self.version.succ
    new_version.procedure = self.procedure
    new_version.save!
    self.new_version = new_version
    self.procedure = self.procedure_was
    super
  end

  #
  # Override destroy to clear out the foreign key references
  def destroy
    transaction do
      if self.old_version
        self.old_version.update_column :new_version_id, nil
      end
      super
    end
  end

  private

  # Ensure that that a Procedure Definition that is not the latest version
  # cannot be destroyed. Procedure Definitions versions work like a stack,
  # only the last one created must be the first one destroyed. 
  def check_is_latest_version
    if self.new_version
      errors[:base] << "This Procedure Definition has newer versions. Delete the newest, first."
      raise ActiveRecord::Rollback 
      return false 
    end
  end

end
