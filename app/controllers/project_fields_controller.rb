class ProjectFieldsController < ApplicationController
  before_action :set_project_field, only: [:show, :edit, :update, :destroy]

  def index
    @project_fields = ProjectField.all
    respond_with(@project_fields)
  end

  def show
    respond_with(@project_field)
  end

  def new
    @project_field = ProjectField.new
    respond_with(@project_field)
  end

  def edit
  end

  def create
    @project_field = ProjectField.new(project_field_params)
    @project_field.save
    respond_with(@project_field)
  end

  def update
    @project_field.update(project_field_params)
    respond_with(@project_field)
  end

  def destroy
    @project_field.destroy
    respond_with(@project_field)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_field
      @project_field = ProjectField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_field_params
      params[:project_field]
    end
end
