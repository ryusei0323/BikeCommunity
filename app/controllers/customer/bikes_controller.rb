class Customer::BikesController < ApplicationController

  def top
    @manufacturer = Manufacturer.where(status: true)
    @bikes = Bike.joins(:manufacturer).where(manufacturers:{status: true}, bike_status:true).order(id: "DESC")
  end

  def index
    @bikes = Bike.where(bike_status: true)
    @manufacturers = Manufacturer.where(status: true)
  end

  def show
    @bike = Bike.find(params[:id])
    @manufacturers = Manufacturer.where(status: true)
  end

end
