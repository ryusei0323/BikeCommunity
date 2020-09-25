class Admin::ManufacturersController < ApplicationController
  before_action :authenticate_admin_user!

  def index
  	@manufacturers = Manufacturer.all
  	@manufacturer = Manufacturer.new
  end

  def create
  	@manufacturer = Manufacturer.new(manufacturer_params)
  	if @manufacturer.save
  	  flash[:notice] = 'メーカーを作成しました'
  	  redirect_to admin_manufacturers_path
  	else
  	  @manufacturers = Manufacturer.all
  	  render :index
  	end
  end

  def edit
  	@manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
      flash[:notice] = 'メーカーを更新しました'
      redirect_to admin_manufacturers_path
    else
      render :edit
    end
  end

  private
  def manufacturer_params
  	params.require(:manufacturer).permit(:manufacturer_name, :status)
  end
end
