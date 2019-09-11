class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @start_date = Date.parse(params["start_date"])
    @end_date = Date.parse(params["end_date"])
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
    redirect_to dashboard_path, notice: 'Your event was successfully destroyed.'
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :amenities, :event_description, :wishlist, :event_image, :cost, :event_category, :address)
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
