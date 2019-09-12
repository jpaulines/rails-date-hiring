class BookingsController < ApplicationController
  skip_after_action :verify_authorized

  def handle_booking
    @booking = Booking.find(params[:id])
    # flash[:notice] = "whatever u want"
    redirect_to dashboard_path if @booking.update(approved: params[:approved])
  end

  def create
    @booking = Booking.new(booking_params)
    # we need 'event_id' to associate booking with corresponding event
    @event = Event.find(params[:event_id])
    @booking.user = current_user
    @booking.event = @event
    authorize @booking
    @booking.save
    redirect_to event_path(@event)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: 'Your booking was successfully cancelled.'
  end

  private

  def booking_params
    params.require(:booking).permit(:motivation)
  end
end
