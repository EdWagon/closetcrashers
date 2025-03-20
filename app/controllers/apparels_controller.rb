class ApparelsController < ApplicationController
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
    @apparel = Apparel.new
  end

  def create
    params[:apparel][:color] = Color.find(params[:apparel][:color].to_i)

    @apparel = Apparel.new(apparel_params)
    @apparel.price = @apparel.price * 100

    respond_to do |format|
      if @apparel.save
        format.html { redirect_to @apparel, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @apparel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apparel.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def apparel_params
    params.require(:apparel).permit(:name, :description, :price, :address, :color, photos: [])

    # TODO: Keep in for reference and amend strong params
    # bookmark_params_hash = params.require(:bookmark).permit(:comment, :movie_id)
    # bookmark_params_hash[:list_id] = params[:list_id]
    # bookmark_params_hash
  end
end
