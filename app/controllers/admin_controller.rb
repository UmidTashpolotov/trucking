class AdminController < ApplicationController
  layout 'admin'
  before_action(:authenticate_user!, :check_admin)

  def check_admin
  	unless current_user.admin?
  		redirect_to root_path flash[:danger] = 'У вас нет доступа'
  	end
  end
  # before_action :authenticate_user!, :admin_user
end