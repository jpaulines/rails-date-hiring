class DashboardsController < ApplicationController
  def profile
    authorize :dashboard, :profile?
    @events = current_user.events
    @my_bookings = current_user.bookings
    @my_bookings_pending = current_user.bookings.where(approved: false)
    @requests = Booking.joins(:event).where(events: { user: current_user }, bookings: { approved: false })
    @approved = Booking.joins(:event).where(events: { user: current_user }, bookings: { approved: true })
  end
end
