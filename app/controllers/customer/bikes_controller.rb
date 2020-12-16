class Customer::BikesController < ApplicationController

  def top
    #アクセスされたバイクの記事上位５件くらい表示できるランキング機能を作りたい
    @manufacturers = Manufacturer.active
    @bikes = Bike.active.limit(4)
  end

  def index
    @bikes = Bike.active
    @manufacturers = Manufacturer.active
  end

  def show
    @bike = Bike.find(params[:id])
    @manufacturers = Manufacturer.active
  end

  def search
    @bikes = Bike.where(manufacturer_id: params[:id]).active
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturers = Manufacturer.active
    render :index
  end
end
