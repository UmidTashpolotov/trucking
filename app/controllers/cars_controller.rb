class CarsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @car = Car.new
  end

  def show
    @car = Car.find(params[:id])
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      create_car_device
      redirect_to my_profile_path, notice: (t 'car_create')
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @before_update_imei = @car.imei
    if @car.update(car_params)
      update_car_device
      redirect_to my_profile_path, notice: (t 'car_update')
    else
      render :edit
    end
  end

  def destroy
    Car.find(params[:id]).destroy
    redirect_to my_profile_path, notice: (t 'car_destroy')
  end

  private

  def car_params
    params.require(:car).permit(:about, :weight, :volume, :load_type, :car_type,
                                :imei)
  end

  def create_car_device
    Device.create(uniqueid: @car.imei, name: @car.user.phone) unless @car.imei.blank?
  end

  def update_car_device
    @device = Device.find_by uniqueid: @before_update_imei
    if @car.has_tracker_and_imei_blank
      @device.destroy
    elsif @car.has_tracker_and_imei_exist
      @device.update(uniqueid: @car.imei)
    else
      create_car_device
    end
  end

end
