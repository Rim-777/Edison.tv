class UsersController < ApplicationController

  respond_to :js, only: :update

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if params[:user][:avatar]
      respond_with (@user)
    else
      respond_with (@user) do | format |
        format.html { redirect_to user_path(@user) }
      end
    end
  end

  def crop_avatar
    @user = User.find(params[:id])
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
end
