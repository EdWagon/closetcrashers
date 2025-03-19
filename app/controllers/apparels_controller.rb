class ApparelsController < ApplicationController
  def index
    @apparels = Apparel.all
  end

  def show
    @apparel = Apparel.find(params[:id])
  end
end
