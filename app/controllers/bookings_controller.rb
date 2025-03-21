class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show accept cancel reject]

  def index
    @apparel = Apparel.find(params[:apparel_id])
    @bookings = @apparel.bookings
  end

  def show
    @apparel = Apparel.find(params[:apparel_id])
  end

  def new
    @apparel = Apparel.find(params[:apparel_id])
    @booking = Booking.new(apparel: @apparel, user: current_user)
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    @booking.apparel = Apparel.find(params[:apparel_id])
    @apparel = @booking.apparel
    if @booking.save
      redirect_to dashboard_path, notice: 'Your booking is submited!! Waiting for the trendsetter to accept...'
    else
      # flash.now[:notice] = @booking.errors.messages.first
      render :new, status: :unprocessable_entity
    end
  end

  def cancel
    if @booking.pending?
      @booking.canceled!
      redirect_to dashboard_path, notice: 'You\'ve cancelled the booking'
    else
      redirect_to dashboard_path, alert: 'Couldn\'t cancel booking'
    end
  end

  def accept
    if @booking.pending?
      @booking.accepted!
      redirect_to dashboard_path, notice: 'You\'ve accepted the booking'
    else
      redirect_to dashboard_path, alert: 'Couldn\'t accept the booking'
    end
  end

  def reject
    if @booking.pending?
      @booking.rejected!
      redirect_to dashboard_path, notice: 'You\'ve rejected the booking'
    else
      redirect_to dashboard_path, alert: 'Couldn\'t reject the booking'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
