class RegistrationsController < Devise::RegistrationsController
  before_action :check_role, only: [:create]
  private

  def sign_up_params
    params.require(:user).permit(:phone, :password, :password_confirmation, :role)
  end

  def account_update_params
    params.require(:user).permit(:phone, :password, :password_confirmation,
                                 :current_password, :role, :name, :surname)
  end

  def check_role
    role = params[:user][:role]
    unless User::REGISTRABLE_ROLES.include?(role)
      redirect_to new_user_registration_path, alert: "ACCESS DENIED!"
    end
  end

end