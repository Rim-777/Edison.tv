class AlbumsController < ApplicationController
  before_action :set_user, only: :index
  respond_to :js, only: [:create, :destroy]

  def index
    respond_with(@albums = @user.albums.all)
  end

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
    @album = Album.find(params[:id])
    respond_with(@album.destroy)
  end


  private
  def album_params
    params.require(:album).permit(:title, :picture)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
