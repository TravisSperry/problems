require 'test_helper'

class ProjectOtherFieldsControllerTest < ActionController::TestCase
  setup do
    @project_other_field = project_other_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_other_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_other_field" do
    assert_difference('ProjectOtherField.count') do
      post :create, project_other_field: {  }
    end

    assert_redirected_to project_other_field_path(assigns(:project_other_field))
  end

  test "should show project_other_field" do
    get :show, id: @project_other_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_other_field
    assert_response :success
  end

  test "should update project_other_field" do
    patch :update, id: @project_other_field, project_other_field: {  }
    assert_redirected_to project_other_field_path(assigns(:project_other_field))
  end

  test "should destroy project_other_field" do
    assert_difference('ProjectOtherField.count', -1) do
      delete :destroy, id: @project_other_field
    end

    assert_redirected_to project_other_fields_path
  end
end
