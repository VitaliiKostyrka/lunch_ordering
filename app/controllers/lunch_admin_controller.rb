class LunchAdminController < ApplicationController
  def index
    if current_user.admin?
      @admin_data = User.admin_dashboard_data
    else
      render file: Rails.root.join('public/404.html'), status: 404
    end
  end
end
