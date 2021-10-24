class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :own_user_info?, only: [:edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.avatar = "user_icon.jpg"

    if @user.save
      redirect_to root_url, notice: 'ユーザー登録が完了しました。ログインしてください。'
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
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :avatar).merge(admin: false)
    end

    def own_user_info?
      user = User.find(params[:id])
      redirect_to users_url, notice: "他ユーザーの情報は変更できません。" if current_user != user
    end
end

