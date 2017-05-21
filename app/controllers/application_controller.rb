class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_project_version

  def after_sign_in_path_for(resource)
    if current_user.role == "admin"
      admin_root_path
    else
      root_path
    end
  end

  def set_project_version
    @project_version = File.read("VERSION") if File.exist?("VERSION")
  end
end
