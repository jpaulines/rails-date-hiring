class EventsController < ApplicationController
skip_before_action :authenticate_user!, only: :index

def index

  #wrap in if statement so they can still return all
  @start_date = Date.parse(params["start_date"])
  @end_date = Date.parse(params["end_date"])
  @date_range = (@start_date..@end_date)
  @city = params["city"]
  @event_category = params["event_category"].downcase
  @events = policy_scope(Event).near(@city, 50).where(date: (@date_range)).where(event_category: @event_category)
  @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end

end

end
