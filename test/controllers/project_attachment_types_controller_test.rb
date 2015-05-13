require 'test_helper'

class ProjectAttachmentTypesControllerTest < ActionController::TestCase
  setup do
    @project_attachment_type = project_attachment_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_attachment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_attachment_type" do
    assert_difference('ProjectAttachmentType.count') do
      post :create, project_attachment_type: { name: @project_attachment_type.name }
    end

    assert_redirected_to project_attachment_type_path(assigns(:project_attachment_type))
  end

  test "should show project_attachment_type" do
    get :show, id: @project_attachment_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_attachment_type
    assert_response :success
  end

  test "should update project_attachment_type" do
    patch :update, id: @project_attachment_type, project_attachment_type: { name: @project_attachment_type.name }
    assert_redirected_to project_attachment_type_path(assigns(:project_attachment_type))
  end

  test "should destroy project_attachment_type" do
    assert_difference('ProjectAttachmentType.count', -1) do
      delete :destroy, id: @project_attachment_type
    end

    assert_redirected_to project_attachment_types_path
  end
end
