class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]
  before_action :set_album, only: :show
  respond_to :js, only: [:create, :destroy]

  def index
    respond_with(@albums = @user.albums.all)
  end


  def show
   respond_with(@album)
  end

  def create
    authorize Album
    @album = current_user.albums.create(album_params)
    respond_with(@album)
  end


  def destroy
    @album = current_user.albums.find(params[:id])
    authorize @album
    respond_with(@album.destroy)
  end


  private
  def album_params
    params.require(:album).permit(:title)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_album
    @album = Album.find(params[:id])
  end
end

