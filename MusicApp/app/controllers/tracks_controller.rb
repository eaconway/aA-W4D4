class TracksController < ApplicationController
  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_album_track_url
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to band_url(@track.band_id)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @track = Track.find(params[:id])
    band_id = @track.band_id

    if @track.delete
      redirect_to band_url
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to album_url(band)
    end

  end


  private

  def track_params
    params.require(:track).permit(:title, :ord, :album_id, :track_type)
  end
end
