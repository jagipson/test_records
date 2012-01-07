require 'test_helper'

class ModelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "require a name" do
    model = Model.new
    assert !model.save, "saved model without a name"
  end
end
