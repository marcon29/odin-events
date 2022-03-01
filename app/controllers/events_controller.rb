class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @locations = Location.all
  end

  def create
    @event = Event.new(event_params)

    # to re-render form
    @locations = Location.all

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @locations = Location.all
  end

  def update
    @event = Event.find(params[:id])
    
    # to re-render form
    @locations = Location.all
    
    @event.assign_attributes(event_params)
    if @event.save
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end


  private
  def event_params
    params.require(:event).permit(:id, :name, :date, :time, :location_id)
  end

end
