require 'test_helper'

class ModelsControllerTest < ActionController::TestCase
  setup do
    @model = models(:one)
    @model[:name] = "Sample Model 1"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model" do
    assert_difference('Model.count') do
      post :create, model: @model.attributes
    end

    assert_redirected_to model_path(assigns(:model))
  end

  test "should show model" do
    get :show, id: @model.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model.to_param
    assert_response :success
  end

  test "should update model" do
    put :update, id: @model.to_param, model: @model.attributes
    assert_redirected_to model_path(assigns(:model))
  end

  test "should destroy model" do
    assert_difference('Model.count', -1) do
      delete :destroy, id: @model.to_param
    end

    assert_redirected_to models_path
  end
end