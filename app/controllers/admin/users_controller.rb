class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.nickname}」を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{user.nickname}」を削除しました。"
  end

  private
  
    def require_admin
      redirect_to root_url unless current_admin_user.admin
    end

    def user_params
      params.require(:user).permit(:nickname, :email, :admin, :password, :password_confirmation)
    end
end
