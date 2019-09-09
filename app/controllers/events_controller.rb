class EventsController < ApplicationController

  def show
    # @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :date, :amenities, :event_description, :wishlist, :event_image, :cost)
  end
end
