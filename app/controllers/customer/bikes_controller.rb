class Customer::BikesController < ApplicationController

  def top
    #アクセスされたバイクの記事上位５件くらい表示できるランキング機能を作りたい
    @manufacturers = Manufacturer.where(status: true)
    @bikes = Bike.where(bike_status: true).limit(4)
  end

  def index
    @bikes = Bike.where(bike_status: true)
    @manufacturers = Manufacturer.where(status: true)
  end

  def show
    @bike = Bike.find(params[:id])
    @manufacturers = Manufacturer.where(status: true)
  end

  def search
    @bikes = Bike.where(manufacturer_id: params[:id]).where(bike_status: true)
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturers = Manufacturer.where(status:true)
    render :index
  end
end
