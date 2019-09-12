class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.reviewer = current_user
    @review.reviewee = User.find(params[:user_id])
    authorize @review
    @review.save
    redirect_to profile_path(@user)
  end

 private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
