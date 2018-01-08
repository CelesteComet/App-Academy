class AlbumsController < ApplicationController
  def index
    @albums = Band.find_by(id: params[:band_id]).albums
  end

  def show
    @album = Album.find_by(id: params[:id])

    # if there is no album then render 404
    if !@album 
      render_not_found
    end
  end

  def new
  end

  def create
    @album = Album.new(album_params)
    if @album.save 
      redirect_to bands_url
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update(band_params)
      redirect_to edit_band_url
    else 
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    Album.find_by(id: params[:id]).destroy
    redirect_to bands_url 
  end

  private 

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id) 
  end
end
