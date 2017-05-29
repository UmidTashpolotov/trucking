class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = !params[:id].nil? ? User.find(params[:id]) : current_user
    @devices = @user.search_devices
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to my_profile_path, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def sms_verify_form; end

  def sms_verify
    if params[:sms_code_input] == current_user.sms_code
      current_user.check_phone
      redirect_to my_profile_path, notice: 'Phone number confirmed'
    else
      redirect_to sms_verify_form_users_path, notice: 'Bad input'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname)
  end
end

