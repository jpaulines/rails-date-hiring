require 'date'


class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @city = fetch_local_events
    @start_date = Date.today
    @end_date = Date.today + 30.days
    @date_range = (@start_date..@end_date)
    @events = policy_scope(Event).near(@city, 50).where(date: (@date_range))
    @events_first = @events.first(3)
  end

  def profile
    @review = Review.new
    @user = User.find(params[:id])
  end

  def fetch_local_events
    ip = "82.80.45.122"
    # request.remote_ip
    coordinates = Geocoder.search(ip)
    # => [30.267153, -97.7430608]
    @city = coordinates.first.city
    # => "United States"
  end
end
