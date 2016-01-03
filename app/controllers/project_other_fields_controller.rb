class ProjectOtherFieldsController < ApplicationController
  before_action :set_project_other_field, only: [:show, :edit, :update, :destroy]

  def index
    @project_other_fields = ProjectOtherField.all
    respond_with(@project_other_fields)
  end

  def show
    respond_with(@project_other_field)
  end

  def new
    @project_other_field = ProjectOtherField.new
    respond_with(@project_other_field)
  end

  def edit
  end

  def create
    @project_other_field = ProjectOtherField.new(project_other_field_params)
    @project_other_field.save
    respond_with(@project_other_field)
  end

  def update
    @project_other_field.update(project_other_field_params)
    respond_with(@project_other_field)
  end

  def destroy
    @project_other_field.destroy
    respond_with(@project_other_field)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_other_field
      @project_other_field = ProjectOtherField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_other_field_params
      params[:project_other_field]
    end
end
