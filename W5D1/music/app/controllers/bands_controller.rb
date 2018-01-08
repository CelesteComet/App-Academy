class BandsController < ApplicationController

  before_action :ensure_user

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find_by(id: params[:id])

    # if there is no band then render 404
    if !@band 
      render_not_found
    end
  end

  def new
  end

  def create
    @band = Band.new(band_params)
    results = GoogleCustomSearchApi.search(band_params[:name], {"searchType" => "image"})
    @band.image_url = results['items'].first.link
    if @band.save 
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find_by(params[:band_id])
    if @band
      if @band.save 
        redirect_to band_url(@band.id)
      else
        flash[:errors] = @band.errors.full_messages
        redirect_to edit_band_url(@band.id)
      end
    else 
      render_not_found
    end
  end

  def update
    if @band.update(band_params)
      redirect_to edit_band_url
    else 
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    Band.find_by(id: params[:id]).destroy
    redirect_to bands_url 
  end

  private 

  def band_params
    params.require(:band).permit(:name) 
  end

  def ensure_user 
    if !current_user 
      redirect_to sessions_new_url
    end
  end
end
