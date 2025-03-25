class MissionsController < ApplicationController

  def show
    @mission = Mission.find(params[:id])
    @organisation = @mission.organisation
  end

  def index
    @missions = Mission.all
    @missions = @missions.where(address: params[:address]) if params[:address].present?
    @missions = @missions.where(category: params[:category]) if params[:category].present?
    @missions = @missions.where(start_date: params[:start_date]) if params[:start_date].present?
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.organisation = current_user.organisations.first

    if @mission.save
      redirect_to organisation_dashboard_path, notice: "Mission créée avec succès."
    else
      @missions = current_user.organisations.first.missions
      @participations_per_mission = @missions.map do |mission|
        mission.participations.where(status: "pending")
      end
      render "pages/organisation_dashboard", status: :unprocessable_entity
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :category, :address, :start_date, :end_date, :photo)
  end
end
