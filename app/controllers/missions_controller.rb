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
    @mission = Mission.new(misison_params)
    @misison.organisation = current_user.organisation.first

    if @mission.save
      redirect_to organisation_dashboard_path, notice: "Mission créée avec succès."
    else
      @missions.participations.where(status: "pending")
    end
  end

  private

  def misison_params
    params.require(:mission).permit(:title, :description, :address, :start_date, :end_date, :photo)
  end
end
