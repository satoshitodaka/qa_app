class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_admin_user
  before_action :login_required

  private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_admin_user
      @current_admin_user ||= User.find_by(id: session[:admin_user_id]) if session[:admin_user_id]
    end

    def login_required
      redirect_to login_url unless current_user || current_admin_user
    end
end
