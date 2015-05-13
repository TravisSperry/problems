class ProjectAttachmentTypesController < ApplicationController
  before_action :set_project_attachment_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project_attachment_types = ProjectAttachmentType.all
    respond_with(@project_attachment_types)
  end

  def show
    respond_with(@project_attachment_type)
  end

  def new
    @project_attachment_type = ProjectAttachmentType.new
    respond_with(@project_attachment_type)
  end

  def edit
  end

  def create
    @project_attachment_type = ProjectAttachmentType.new(project_attachment_type_params)
    @project_attachment_type.save
    respond_with(@project_attachment_type)
  end

  def update
    @project_attachment_type.update(project_attachment_type_params)
    respond_with(@project_attachment_type)
  end

  def destroy
    @project_attachment_type.destroy
    respond_with(@project_attachment_type)
  end

  private
    def set_project_attachment_type
      @project_attachment_type = ProjectAttachmentType.find(params[:id])
    end

    def project_attachment_type_params
      params.require(:project_attachment_type).permit(:name)
    end
end
