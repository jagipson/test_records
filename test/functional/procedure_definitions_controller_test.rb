require 'test_helper'

class ProcedureDefinitionsControllerTest < ActionController::TestCase
  setup do
    @procedure_definition = procedure_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create procedure_definition" do
    assert_difference('ProcedureDefinition.count') do
      #post :create, procedure_definition: @procedure_definition.attributes
      post :create, {:commit => 'Create', :record => { :name => 'foo'}}
    end

    assert_redirected_to procedure_definitions_path
  end

  test "should show procedure_definition" do
    get :show, id: @procedure_definition.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @procedure_definition.to_param
    assert_response :success
  end

  test "should update procedure_definition" do
    put :update, id: @procedure_definition.to_param, record: @procedure_definition.attributes
    assert_redirected_to procedure_definitions_path
  end

  test "should destroy procedure_definition" do
    assert_difference('ProcedureDefinition.count', -1) do
      delete :destroy, id: @procedure_definition.to_param
    end

    assert_redirected_to procedure_definitions_path
  end
end
