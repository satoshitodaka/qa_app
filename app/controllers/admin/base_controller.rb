class Admin::BaseController < ApplicationController
  before_action :admin_login_required
  
  private

    def admin_login_required
      redirect_to login_url unless current_admin_user.admin
    end
end
