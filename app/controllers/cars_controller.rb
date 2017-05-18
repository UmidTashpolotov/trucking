class CarsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.create(car_params)
    if @car.save
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
    if @car.update(car_params)
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
    params.require(:car).permit(:about, :weight, :volume, :load_type, :car_type, :imei)
  end
end
