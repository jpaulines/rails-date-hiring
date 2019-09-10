class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def show
    # @event = Event.find(params[:id])
    @booking = Booking.new
    @user = @event.user
    @last_event = Event.last
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
    params.require(:event).permit(:name, :location, :date, :amenities, :event_description, :wishlist, :event_image, :cost)
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
