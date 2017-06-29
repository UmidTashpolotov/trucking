class UsersController < ApplicationController
  require 'net/http'
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
        format.html { redirect_to my_profile_path, notice: 'Ваш профиль успешно обновлен' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def sms_verify
    if params[:sms_code_input] == current_user.sms_code
      current_user.check_phone
      redirect_to my_profile_path, notice: 'Номер телефона подтвержден'
    else
      redirect_back(fallback_location: root_path, notice: 'Неверный код')
    end
  end

  def send_sms_code
    if user_session['last_sms_time'].blank?
      user_session['last_sms_time'] = Time.now
      sms_sender(current_user.phone, current_user.sms_code, current_user.nikita_id)
    elsif !user_session['last_sms_time'].blank? && (Time.now - user_session['last_sms_time'].to_datetime).to_i > 3600
      user_session['last_sms_time'] = Time.now
      sms_sender(current_user.phone, current_user.sms_code, current_user.nikita_id)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, notice: 'После отправки последнего смс прошло меньше часа')
    end
  end

  def sms_sender(phone, message, nikita_id)
    xml_string = xml_string_for_sms_send(phone,message, nikita_id)
    uri = URI.parse 'http://smspro.nikita.kg/api/message'
    request = Net::HTTP::Post.new uri.path
    request.body = xml_string
    request.content_type = 'text/xml'
    response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request request}
    xml_doc = Nokogiri::XML(response.body)
    @status = xml_doc.css('status').first.text
    message = xml_doc.css('message').text
    @status == '0' ? flash[:notice] = 'СМС успешно отправлено' : flash[:danger] = message
  end

  def xml_string_for_sms_send(phone, message, nikita_id)
    '<?xml version="1.0" encoding="UTF-8"?>
    <message>
    <login>xak</login>
    <pwd>testpassword</pwd>
    <id>' + nikita_id + '</id>
    <sender>996555355666</sender>
    <text>' + message + '</text>
    <phones><phone>' + phone + '</phone></phones>
    </message>'
  end

  def check_phone
    user = User.find(params[:id])
    user.check_phone
    redirect_back(fallback_location: root_path)
  end

  def reset_password_form; end

  def reset_password
    user = User.find_by_phone(params[:phone_number])
    if user
      new_user_password = rand(100_000..999_999).to_s
      user.reset_password(new_user_password, new_user_password)
      sms_sender(user.phone,'Новый пароль: ' + new_user_password, user.nikita_id)
      redirect_to new_user_session_path
    else
      redirect_back(fallback_location: reset_password_users_path, notice: 'Пользователя с таким номер нет в системе')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :avatar)
  end
end

