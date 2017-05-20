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
      Device.create(uniqueid: @car.imei, name: @car.user.name) unless @car.imei.blank?
      redirect_to my_profile_path, notice: (t 'car_create')
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end
# @TODO refactor this shit!
  def update
    @car = Car.find(params[:id])
    @before_update_imei = @car.imei
    if @car.update(car_params)
      @device = Device.find_by uniqueid: @before_update_imei
      if @car.imei.blank? && @car.has_tracker?
        @device.destroy
      elsif @car.has_tracker? && !car.imei.blank?
        @device.update(uniqueid: @car.imei)
      end
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
end
