class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def show
    # @event = Event.find(params[:id])
    @booking = Booking.new
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :date, :amenities, :event_description, :wishlist, :event_image, :cost)
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
