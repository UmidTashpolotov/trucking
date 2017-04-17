class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?    
      params[:user].delete(:password)    
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'admin/users/_form'
    end
  end

  def destroy
    User.destroy(params[:id])

    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:name, :surname, :phone,
                                 :email, :password, :password_confirmation,
                                 role: [:worker, :customer])
  end
end
