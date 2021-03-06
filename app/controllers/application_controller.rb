class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.role == 'admin'
      admin_root_path
    else
      root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "У вас нет доступа"
    redirect_back(fallback_location: root_path)
  end
end
