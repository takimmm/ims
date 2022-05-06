class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(im_id: params[:im_id])
    redirect_back(fallback_location: root_path)
  end
  def destroy
    @im = Im.find(params[:im_id])
    @favorite = current_user.favorites.find_by(im_id: @im.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
