class Admin::BikesController < ApplicationController

  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      flash[:notice] = 'バイクを作成しました'
      redirect_to admin_bike_path(@bike.id)
    else
      render :new
    end
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
      flash[:notice] = 'バイクを更新しました'
      redirect_to admin_bikes_path
    else
      render :edit
    end
  end

  private
  def bike_params
    params.require(:bike).permit(:manufacturer_id, :bike_name, :bike_type_name, :displacement, :bike_image, :bike_sentence, :bike_status)
  end

end
