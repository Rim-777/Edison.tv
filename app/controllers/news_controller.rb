class NewsController < ApplicationController
  before_action :set_album, only: :create
  respond_to :js, only: :create

  def show

  end

  def index
    @news = News.all
  end

  def create
    respond_with(@news = @album.news.create(user_id: current_user.id, commentary: @album.title))
  end

  private
  def set_album
    @album = Album.find(params[:album_id])
  end

end
