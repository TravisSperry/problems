require 'test_helper'

class ProjectFieldsControllerTest < ActionController::TestCase
  setup do
    @project_field = project_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_field" do
    assert_difference('ProjectField.count') do
      post :create, project_field: {  }
    end

    assert_redirected_to project_field_path(assigns(:project_field))
  end

  test "should show project_field" do
    get :show, id: @project_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_field
    assert_response :success
  end

  test "should update project_field" do
    patch :update, id: @project_field, project_field: {  }
    assert_redirected_to project_field_path(assigns(:project_field))
  end

  test "should destroy project_field" do
    assert_difference('ProjectField.count', -1) do
      delete :destroy, id: @project_field
    end

    assert_redirected_to project_fields_path
  end
end
