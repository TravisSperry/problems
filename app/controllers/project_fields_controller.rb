class ProjectFieldsController < ApplicationController
  before_action :set_project_field, only: [:show, :edit, :update, :destroy]

  # GET /project_fields
  # GET /project_fields.json
  def index
    @project_fields = ProjectField.all
    respond_with(@project_fields)
  end

  # GET /project_fields/1
  # GET /project_fields/1.json
  def show
    respond_with(@project_field)
  end

  # GET /project_fields/new
  def new
    @project_field = ProjectField.new
    respond_with(@project_field)
  end

  # GET /project_fields/1/edit
  def edit
  end

  # POST /project_fields
  # POST /project_fields.json
  def create
    @project_field = ProjectField.new(project_field_params)
    @project_field.save
    respond_with(@project_field)
  end

  # PATCH/PUT /project_fields/1
  # PATCH/PUT /project_fields/1.json
  def update
    @project_field.update(project_field_params)
    respond_with(@project_field)
  end

  # DELETE /project_fields/1
  # DELETE /project_fields/1.json
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
      params.require(:project_field).permit(:name, :content, :position, :project_id)
    end
end
