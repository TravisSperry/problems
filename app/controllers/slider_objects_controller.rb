class SliderObjectsController < ApplicationController
  before_action :set_slider_object, only: [:show, :edit, :update, :destroy]

  def index
    @slider_objects = SliderObject.all
    respond_with(@slider_objects)
  end

  def show
    respond_with(@slider_object)
  end

  def new
    @slider_object = SliderObject.new
    respond_with(@slider_object)
  end

  def edit
  end

  def create
    @slider_object = SliderObject.new(slider_object_params)
    @slider_object.save
    respond_with(@slider_object)
  end

  def update
    @slider_object.update(slider_object_params)
    respond_with(@slider_object)
  end

  def destroy
    @slider_object.destroy
    respond_with(@slider_object)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider_object
      @slider_object = SliderObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_object_params
      params[:slider_object]
      params.require(:slider_objects).permit(:project_id, :resource, :position, :_destroy, :description, :order)
    end
end
