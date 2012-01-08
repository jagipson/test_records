require 'test_helper'

class ModelsControllerTest < ActionController::TestCase
  setup do
    @model = models(:one)
    @model[:name] = "Sample Model 1"
  end

end
