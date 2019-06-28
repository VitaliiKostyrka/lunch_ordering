class UsersController < ApplicationController
  def index
    @instance_var = 2
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "Your profile updated"
    else
      @error = @user.errors.full_messages
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
