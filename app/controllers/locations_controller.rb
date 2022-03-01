class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
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
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    
    
    @location.assign_attributes(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    redirect_to locations_path
  end


  private
  def location_params
    params.require(:location).permit(:id, :name, :address, :city, :state, :zip)
  end
end

