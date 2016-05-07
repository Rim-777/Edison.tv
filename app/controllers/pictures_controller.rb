class PicturesController < ApplicationController
  before_action :set_album, except: :destroy
  before_action :set_picture, except: :create

  respond_to :js, only: [:create, :destroy]
  def show

  end

  def create
    @picture = @album.pictures.create(picture_params.merge(user_id: current_user.id))
    respond_with (@picture) do |format|
      format.html { redirect_to album_path(@album) }
    end
  end


  def destroy
    # render text: params
    @picture.remove_image!
    @picture.save
    respond_with (@picture.destroy)
  end


  private
  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :title)
  end
end
