class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @start_date = Date.parse(params["date_range"].first(10))
    @end_date = Date.parse(params["date_range"].last(10))
    @user = current_user
    @date_range = (@start_date..@end_date)
    @city = params["city"]
    @event_categories = params["post"]["category_ids"]
    @events = policy_scope(Event).near(@city, 50).where(date: (@date_range)).where(event_category: (@event_categories))
    @markers = @events.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { event: event })
        }
    end

  end

  def show
    @def = "https://res.cloudinary.com/dakarw0uq/image/upload/v1568110461/shct4ik7e0oqer86pfbh.jpg"
    @booking = Booking.new
    @user = current_user
    @event_user = @event.user

    # @event = Event.geocode # returns flats with coordinates

    @markers =
      [{
        lat: @event.latitude,
        lng: @event.longitude
      }]
  end

  def new
    @event = Event.new
    @user = current_user
    @event_categories = EventCategory.all
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    # @event.event_category_id = EventCategory.find(params[event_category].to_i)
    @event.user = current_user
    authorize @event
    if @event.save!
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Your event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to dashboard_path, notice: 'Your event was successfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :amenities, :event_description, :wishlist, :event_image, :cost, :event_category_id, :address)
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
