class EventsController < ApplicationController

  def new
    @event = Event.new
    authorize @event
  end

  def create
     @event = Event.new(event_params)
     @event.user = current_user
     authorize @event
    if @event.save!
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

end

private
 def event_params
   params.require(:event).permit(:name, :location, :date, :amenities, :event_description, :wishlist, :event_image, :cost)
 end
