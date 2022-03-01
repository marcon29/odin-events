class EventsController < ApplicationController
  before_action :require_login, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_locations_collection, only: [:new, :create, :edit, :update]


  def index
    @events = Event.all
    @user ||= User.new
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    binding.pry

    # if @event.save
    #   redirect_to events_path
    # else
    #   render :new
    # end
  end

  def edit
  end

  def update
    @event.assign_attributes(event_params)
    if @event.save
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    event.destroy
    redirect_to root_path
  end



  private
  def event_params
    params.require(:event).permit(:id, :name, :date, :time, :location_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_locations_collection
    @locations = Location.all
  end

end
