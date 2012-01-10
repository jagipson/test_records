require 'test_helper'

class ProcedureDefinitionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "the name must be set" do
    pd = ProcedureDefinition.new
    assert ! pd.save, "saved ProcedureDefintion without a name"
  end
end
