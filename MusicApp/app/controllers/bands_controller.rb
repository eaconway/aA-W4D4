class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  #Create a band page
  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end

  end

  def destroy
    @band = Band.find(params[:id])

    if @band.delete
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to band_url(band)
    end

  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
