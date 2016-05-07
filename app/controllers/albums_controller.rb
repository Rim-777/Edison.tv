class AlbumsController < ApplicationController

  def new

  end

  def show
    @album = Album.find(params[:id])
  end

  def create
    @album = current_user.albums.create(album_params)
    respond_with(@album)

  end

  def update

  end

  def destroy

  end

  private
  def album_params
    params.require(:album).permit(:title)
  end
end
