class BookingsController < ApplicationController
  skip_after_action :verify_authorized
  def handle_booking
    @booking = Booking.find(params[:id])
    # flash[:notice] = "whatever u want"
    redirect_to dashboard_path if @booking.update(approved: params[:approved])
  end
end
