class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  # GET /projects
  # GET /projects.json
  def index
    @current_page = "PROJECTS"
    @projects = Project.all
    @new_nav = true;

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @new_nav = true;

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @isgrey = true;
    @current_page = "ADD PROJECT"
    @project = Project.new
    @project_attachment = @project.project_attachments.build
    @slider_object = @project.slider_objects.build
    @project_field = @project.project_fields.build
    @project_other_field = @project.project_other_fields.build

    @types = Type.all
    @new_nav = true;

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @current_page = "EDIT PROJECT"
    @isgrey = true;
    @new_nav = true;
    @edit = true
    @project = Project.includes(:project_attachments).find(params[:id])
    @project_attachment = @project.project_attachments.build
    @slider_object = @project.slider_objects.build
    @project_field = @project.project_fields.build

  end

  # POST /projects
  # POST /projects.json
  def create
    @new_nav = true;
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        if params[:project_attachments]
          create_attachments
        end

        if params[:project_fields]
          create_fields
        end

        if params[:slider_objects]
          create_slider_objects
        end

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_codes/1
  # PATCH/PUT /coupon_codes/1.json
  def update
    @new_nav = true;
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(project_params)
        if params[:project_attachments]
          create_attachments
        end

        if params[:project_fields]
          create_fields
        end

        if params[:slider_objects]
          create_slider_objects
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_codes/1
  # DELETE /coupon_codes/1.json
  def destroy
    @new_nav = true;
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to project_url }
      format.json { head :no_content }
    end
  end

  private
    def create_attachments
      params[:project_attachments_attributes].each do |project_attachment_attributes|
        @project_attachment = @project.project_attachments.create!(
                                    :resource => project_attachment_attributes[:resource],
                                    :project_attachment_type_id => project_attachment_attributes[:project_attachment_type_id].to_i,
                                    :project_id => @project.id)
      end
    end

    def create_fields
      params[:project_fields_attributes].each do |project_field_attributes|
        @project_field = @project.project_fields.create!(
                                    :type_id => project_field_attributes[:type_id].to_i,
                                    :project_id => @project.id)
      end
    end

    def create_slider_objects
      params[:slider_objects_attributes].each do |slider_object_attributes|
        @slider_object = @project.slider_objects.create!(
                                    :resource => slider_object_attributes[:resource],
                                    :project_id => @project.id)
      end
    end

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def project_params
      params.require(:project).permit(
      :name,
      :status,
      :user_id,
      :content,
      :type_id,
      :solution,
      :problem_statement,
      :author_name,
      :author_link,
      { tag_ids:
        []},
      { standard_ids:
        []},
      :featured_image,
      :remove_featured_image,
      :featured_image_cache,
      { project_attachments_attributes:
        [:project_attachment_type_id, :resource, :_destroy, :id, :title]},
      { project_fields_attributes:
        [:name, :position, :content, :id, :_destroy]},
      { project_other_fields_attributes:
        [:name, :position, :content, :id, :_destroy]},
      { slider_objects_attributes:
        [:description, :resource, :id, :_destroy]}
      )
    end
end
