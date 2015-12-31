class ProjectFieldsController < ApplicationController
  before_action :set_project_field, only: [:show, :edit, :update, :destroy]

  # GET /project_fields
  # GET /project_fields.json
  def index
    @project_fields = ProjectField.all
  end

  # GET /project_fields/1
  # GET /project_fields/1.json
  def show
  end

  # GET /project_fields/new
  def new
    @project_field = ProjectField.new
  end

  # GET /project_fields/1/edit
  def edit
  end

  # POST /project_fields
  # POST /project_fields.json
  def create
    @project_field = ProjectField.new(project_field_params)

    respond_to do |format|
      if @project_field.save
        format.html { redirect_to @project_field, notice: 'Project field was successfully created.' }
        format.json { render :show, status: :created, location: @project_field }
      else
        format.html { render :new }
        format.json { render json: @project_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_fields/1
  # PATCH/PUT /project_fields/1.json
  def update
    respond_to do |format|
      if @project_field.update(project_field_params)
        format.html { redirect_to @project_field, notice: 'Project field was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_field }
      else
        format.html { render :edit }
        format.json { render json: @project_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_fields/1
  # DELETE /project_fields/1.json
  def destroy
    @project_field.destroy
    respond_to do |format|
      format.html { redirect_to project_fields_url, notice: 'Project field was successfully destroyed.' }
      format.json { head :no_content }
    end
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
