class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def show
    # @event = Event.find(params[:id])
    @booking = Booking.new
    @user = @event.user
  end

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

  def edit
    authorize @event
  end

  def update
    authorize @event
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
