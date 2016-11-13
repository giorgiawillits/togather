# app/controllers/events_controller.rb

class EventsController < ApplicationController
  before_action :set_current_user

  # GET /events/1
  def show
    @event = Event.find_by_id(params[:id])
  end

  # GET /events/new
  def new
      @groups = current_user.groups
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    event = Event.new(event_params)
    if event.save
      redirect_to '/'
    else
      redirect_to new_event_path
    end
  end

  # PUT /events/1
  def update
  end

  # DELETE /events/1
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_time, :end_time, :title, :description)
    end
end
