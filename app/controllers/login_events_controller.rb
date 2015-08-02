class LoginEventsController < ApplicationController
  before_action :set_login_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @login_events = LoginEvent.all
    respond_with(@login_events)
  end

  def show
    respond_with(@login_event)
  end

  def new
    @login_event = LoginEvent.new
    respond_with(@login_event)
  end

  def edit
  end

  def create
    @login_event = LoginEvent.new(login_event_params)
    @login_event.save
    respond_with(@login_event)
  end

  def update
    @login_event.update(login_event_params)
    respond_with(@login_event)
  end

  def destroy
    @login_event.destroy
    respond_with(@login_event)
  end

  private
    def set_login_event
      @login_event = LoginEvent.find(params[:id])
    end

    def login_event_params
      params.require(:login_event).permit(:user_id)
    end
end
