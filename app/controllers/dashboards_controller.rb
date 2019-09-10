class DashboardsController < ApplicationController
  def dashboard
    authorize :dashboard, :profile?
    @events = current_user.events
    @my_bookings = current_user.bookings
    @my_bookings_pending = current_user.bookings.where(approved: nil)
    @my_bookings_approved = current_user.bookings.where(approved: true)
    @requests = Booking.joins(:event).where(events: { user: current_user }, bookings: { approved: nil || false })
    @requests_approved = Booking.joins(:event).where(events: { user: current_user }, bookings: { approved: true })
    @approved = Booking.joins(:event).where(events: { user: current_user }, bookings: { approved: true })
  end
end
