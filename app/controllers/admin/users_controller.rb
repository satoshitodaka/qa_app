class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
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
    def user_params
      params.require(:user).permit(:nickname, :email, :admin, :password, :password_confirmation)
    end
end
