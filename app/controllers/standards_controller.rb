class StandardsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authorize_admin!, except: [:show, :index]

  before_action :set_standard, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @current_page = "STANDARDS"
    @standards = Standard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @standards }
      format.csv { send_data @standards.to_csv }
    end
  end

  def show
    respond_with(@standard)
  end

  def new
    @current_page = "ADD STANDARD"
    @standard = Standard.new
    respond_with(@standard)
  end

  def edit
    @current_page = "EDIT STANDARD"
  end

  def create
    @standard = Standard.new(standard_params)
    @standard.save
    respond_with(@standard)
  end

  def update
    @standard.update(standard_params)
    respond_with(@standard)
  end

  def destroy
    @standard.destroy
    respond_with(@standard)
  end

  def import
    Standard.import(params[:file])
    redirect_to standards_path, notice: "Standards imported."
  end

  private
    def set_standard
      @standard = Standard.find(params[:id])
    end

    def standard_params
      params.require(:standard).permit(:code, :category, :subcategory)
    end
end
