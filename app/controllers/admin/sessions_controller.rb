class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    reset_session
    admin_user = User.find_by(email: admin_session_params[:email])

    if admin_user&.authenticate(admin_session_params[:password]) && admin_user.admin
      session[:admin_user_id] = admin_user.id
      redirect_to admin_questions_url, notice: '管理者ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private
    def admin_session_params
      params.require(:session).permit(:email, :password)
    end
end
