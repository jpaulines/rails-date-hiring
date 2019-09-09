class BookingsController < ApplicationController
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

  private

  def booking_params
    params.require(:booking).permit(:motivation)
  end
end
