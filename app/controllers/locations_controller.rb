class LocationsController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @location.assign_attributes(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    location.destroy
    redirect_to root_path
  end



  private
  def location_params
    params.require(:location).permit(:id, :name, :address, :city, :state, :zip)
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end

