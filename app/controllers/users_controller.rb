class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  respond_to :js, only: :update

  def show
  end

  def update
    authorize(@user)
    @user.update(user_params)
    respond_with(@user)
  end

  def crop_avatar
    if request.patch?
      @user.crop_avatar!(params[:user][:avatar_crop])
      respond_with (@user) do |format|
        format.html { redirect_to user_path(@user) }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
