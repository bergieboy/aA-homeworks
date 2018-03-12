class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.create(band_params)

    if @band
      redirect_to bands_url
    else
      flash[:errors] = ["Bands have naes, man!"]
      redirect_to new_band_url
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find_by(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    @band = Band.find_by(params[:id])
    if @band.update_attributes(band_params)
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def destroy
    @band = Band.find_by(params[:id])
    @band.delete
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
