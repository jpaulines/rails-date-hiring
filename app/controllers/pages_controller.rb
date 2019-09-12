class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
  end

  def profile
    @review = Review.new
    @user = User.find(params[:id])
  end
end
