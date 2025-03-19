class MissionsController < ApplicationController

  def show
    @mission = Mission.find(params[:id])
  end

end
