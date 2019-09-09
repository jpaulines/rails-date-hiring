class BookingsController < ApplicationController
  skip_after_action :verify_authorized
  def handle_booking
    @booking = Booking.find(params[:id])
    redirect_to profile_path if @booking.update(approved: params[:approved])
  end
end
