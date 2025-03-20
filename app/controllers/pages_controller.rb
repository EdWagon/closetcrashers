class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  def home
  end

  def dashboard
    @apparel_listings = current_user.apparels
    @apparel_bookings = Booking.joins(:apparel).where(apparel: { user_id: current_user.id })
    @booking_requests = current_user.bookings
  end

end
