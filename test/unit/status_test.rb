require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "name cannot be empty" do
    status = Status.new
    assert !status.save, "saved a status with empty name"
  end
end
