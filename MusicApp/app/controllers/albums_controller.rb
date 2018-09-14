class AlbumsController < ApplicationController

  def new
    # debugger
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to band_url(@album.band_id)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band_id = @album.band_id

    if @album.delete
      redirect_to band_url
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to album_url(band)
    end

  end


  private

  def album_params
    params.require(:album).permit(:title, :band_id, :year, :album_type)
  end
end
