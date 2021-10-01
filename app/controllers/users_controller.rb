class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to root_url, notice: 'ユーザー登録が完了しました。'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to user_url, notice: "ユーザー「#{@user.nickname}」を編集しました。"
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation).merge(admin: false)
    end
end

