class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.mission = Mission.find(params[:format].to_i)
    @favorite.save!
  end
end
