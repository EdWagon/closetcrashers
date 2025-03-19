class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :destroy, :accept, :reject]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def new
    @apparel = Apparel.find(params[:apparel_id])
    @booking = Booking.new(apparel: @apparel)
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Your booking is submited!! Waiting for the trendsetter to accept...'
    else
      @apparel = @booking.apparel
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'The booking is canceled'
  end

  def accept
    if @booking.pending?
      @booking.accepted!
      redirect_to @booking, notice: 'You ve accepted the booking'
    else
      redirect_to @booking, alert: 'Didnt work'
    end
  end

  def reject
    if @booking.pending?
      @booking.rejected!
      redirect_to @booking, notice: 'You ve rejected the booking'
    else
      redirect_to @booking, alert: 'Didnt work'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:apparel_id, :start_date, :end_date)
  end
end
