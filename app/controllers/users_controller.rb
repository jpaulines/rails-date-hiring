class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :city, :description, :profile_image, :height, :strength, :language, :hidden_talent, :talkativeness, :funniness, :username, :age, :gender)
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
