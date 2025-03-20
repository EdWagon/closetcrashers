class ApparelsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @apparels = Apparel.all

    @markers = @apparels.geocoded.map do |apparel|
      {
        lat: apparel.latitude,
        lng: apparel.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {apparel: apparel})
      }
    end
  end

  def show
    @apparel = Apparel.find(params[:id])
    @apparel.price = @apparel.price / 100
  end

  def new
    @apparel = Apparel.new(user: current_user)
  end

  def create
    color = Color.find(params[:apparel][:color].to_i)
    params[:apparel].delete(:color)


    @apparel = Apparel.new(apparel_params)
    @apparel.price = @apparel.price * 100
    @apparel.color = color
    @apparel.user = current_user

    respond_to do |format|
      if @apparel.save

        format.html { redirect_to @apparel, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @apparel }
      else
        flash.now[:notice] = @apparel.errors.full_messages.first
        # raise
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apparel.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def apparel_params
    params.require(:apparel).permit(:name, :description, :price, :address, :user, photos: [] )
  end
end
