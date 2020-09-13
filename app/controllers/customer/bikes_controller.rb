class Customer::BikesController < ApplicationController

  def index
    @bikes = Bike.where(bike_status: true)
    @manufacturers = Manufacturer.where(status: true)
  end

  def show
    @bike = Bike.find(params[:id])
    @manufacturers = Manufacturer.where(status: true)
  end

end
