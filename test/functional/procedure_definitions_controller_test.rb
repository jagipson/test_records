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

  test "update procedure_definition should add record and associate" do
    count_before = ProcedureDefinition.all.count
    @procedure_definition.attributes[:name] = "oneB"
    put :update, id: @procedure_definition.to_param, record: @procedure_definition.attributes
    assert_response 302, "error updating record"
    count_after = ProcedureDefinition.all.count
    assert count_before + 1 == count_after, "record count did not increment by 1"
    @p_one = ProcedureDefinition.find(@procedure_definition.id)
    @p_one_b = @p_one.new_version
    assert @p_one.id != @p_one_b.id, "did not create distinct record"

  end

  test "should destroy procedure_definition if newest" do
    assert_difference('ProcedureDefinition.count', -1) do
      delete :destroy, id: @procedure_definition.to_param
    end
    assert_redirected_to procedure_definitions_path
  end

  test "should not destroy procedure_definition if exist newer" do
    # Use fixture :two - it has a child and grand_child (two newer versions)
    @p_two = procedure_definitions(:two)
    # Prove that we got the record okay
    assert ProcedureDefinition.exists?(@p_two), "fixture two destroyed before deleted"
    # prove that deleting it at this point does not work (subject still
    # exists)
    delete :destroy, id: @p_two.id
    assert ProcedureDefinition.exists?(@p_two), "fixture two was deleted when it had a newer version"

    # delete grandchild, child, and subject
    delete :destroy, id: @p_two.new_version.new_version.id
    delete :destroy, id: @p_two.new_version.id
    delete :destroy, id: @p_two.id

    # test that subject no longer exists.
    assert ! ProcedureDefinition.exists?(@p_two), "fixture two was not deleted after deleting the newer version"
    
  end
end
