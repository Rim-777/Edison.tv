class NewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_newsable, only: :create
  respond_to :js, only: :create

  def index
    respond_with(@news = News.all.includes(:newsable))
  end

  def create
    authorize News
    @news = current_user.news.create(newsable_type: @newsable.class , newsable_id: @newsable.id, commentary: @newsable.title)
    respond_with(@news)
  end

  private
  def set_newsable
    @newsable = Album.find(params[:album_id])
  end
end
