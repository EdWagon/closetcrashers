class DashboardController < ApplicationController

  def show
    @apparel_listings = current_user.apparels
    @apparel_bookings = Booking.joins(:apparel).where(apparel: { user_id: current_user.id })
    @booking_requests = current_user.bookings
  end

end
