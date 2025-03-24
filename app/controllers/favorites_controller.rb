class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.mission = Mission.find(params[:format].to_i)
    @favorite.save!
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
    redirect_to dashboard_path, notice: "Mission retiré de vos favoris"
  end
end
