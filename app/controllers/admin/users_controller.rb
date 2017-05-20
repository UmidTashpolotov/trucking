class Admin::UsersController < AdminController
  def index
    @users =  case params[:sort]
              when 'all'
                User.all
              when 'admins'
                User.where(role: 'admin')
              when 'workers'
                User.where(role: 'worker')
              when 'customers'
                User.where(role: 'customer')
              when 'inactive_workers'
                User.where(role: 'worker', active: false)
              when 'inactive_customers'
                User.where(role: 'customer', active: false)
              else
                User.all
              end
    @users = @users.page(params[:page]).per(10).order('created_at ASC')
  end

  def inactive
    @users = User.where(active: false)
  end

  def new
    @user = User.new
  end

  def activate
    @user = User.find(params[:id])
    @user.activate
    redirect_to admin_users_path
  end

  def deactivate
    @user = User.find(params[:id])
    @user.deactivate
    redirect_to admin_users_path
  end

  def show_docs
    @user = User.find(params[:id])
    @documents = @user.documents
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
    params.require(:user).permit(:name, :surname, :phone, :email, :password,
                                 :password_confirmation, :role)
  end
end
