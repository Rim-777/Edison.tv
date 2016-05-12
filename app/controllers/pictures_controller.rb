class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_album
  before_action :set_picture, only: :destroy

  respond_to :js, only: [:create, :destroy]


  def create
    authorize Picture
    @picture = current_user.pictures.create(picture_params.merge(album_id: @album.id))
    respond_with (@picture)
  end

  def destroy
    authorize @picture
    @picture.remove_image!
    @picture.save
    respond_with (@picture.destroy)
  end

  private
  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_picture
    @picture = current_user.pictures.find_by(id: params[:id], user_id: current_user.id)
  end

  def picture_params
    params.require(:picture).permit(:image)
  end
end
