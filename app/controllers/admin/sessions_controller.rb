class Admin::SessionsController < Admin::BaseController
  skip_before_action :admin_login_required

  def new
  end

  def create
    reset_session
    admin_user = User.find_by(email: admin_session_params[:email])

    if admin_user.admin
      if admin_user&.authenticate(admin_session_params[:password])
        session[:admin_user_id] = admin_user.id
        redirect_to admin_questions_url, notice: '管理者ログインしました。'
      else
        render :new
      end
    else
      redirect_to login_url, info: '管理者権限を確認してください。'
    end
  end

  # destroyは一般ユーザー向けと共用

  private

    def admin_session_params
      params.require(:session).permit(:email, :password)
    end
end
