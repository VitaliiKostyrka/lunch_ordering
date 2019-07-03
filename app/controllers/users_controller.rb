class UsersController < ApplicationController
  def index
    @data = current_user.dashboard_data_for_this_date(params[:date] || Time.now.to_s)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'Your profile updated'
    else
      redirect_to edit_user_path, alert: 'Your profile not updated'
    end
  end

  def edit
    @user = current_user
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
