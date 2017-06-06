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
        format.html {redirect_to my_profile_path, notice: 'Ваш профиль успешно обновлен'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def sms_verify_form
    redirect_to my_profile_path if current_user.phone_checked?
  end

  def sms_verify
    if params[:sms_code_input] == current_user.sms_code
      current_user.check_phone
      redirect_to my_profile_path, notice: 'Номер телефона подтвержден'
    else
      redirect_to sms_verify_form_users_path, notice: 'Неверный код'
    end
  end

  def send_sms_code
    if user_session['last_sms_time'].blank?
      user_session['last_sms_time'] = Time.now
      sms_sender
    elsif !user_session['last_sms_time'].blank? && (Time.now - user_session['last_sms_time'].to_datetime).to_i > 3600
      user_session['last_sms_time'] = Time.now
      sms_sender
    else
      redirect_to sms_verify_form_users_path, notice: 'После отправки последнего смс прошло меньше часа'
    end
  end

  def sms_sender
    xml_string = xml_string_for_sms_send
    uri = URI.parse 'http://smspro.nikita.kg/api/message'
    request = Net::HTTP::Post.new uri.path
    request.body = xml_string
    request.content_type = 'text/xml'
    response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request request}
    xml_doc = Nokogiri::XML(response.body)
    @status = xml_doc.css('status').first.text
    message = xml_doc.css('message').text
    @status == '0' ? flash[:notice] = 'СМС успешно отправлено' : flash[:danger] = message
    redirect_back(fallback_location: root_path)
  end

  def xml_string_for_sms_send
    '<?xml version="1.0" encoding="UTF-8"?>
    <message>
    <login>xak</login>
    <pwd>testpassword</pwd>
    <id>' + current_user.nikita_id + '</id>
    <sender>996555355666</sender>
    <text>' + current_user.sms_code + '</text>
    <phones><phone>' + current_user.phone + '</phone></phones>
    </message>'
  end

  def check_phone
    user = User.find(params[:id])
    user.check_phone
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname)
  end
end

