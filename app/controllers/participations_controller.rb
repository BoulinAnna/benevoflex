class ParticipationsController < ApplicationController

  def create
    @mission = Mission.find(params[:mission_id])
    @participation = Participation.new
    @participation.mission = @mission
    @participation.user = current_user
    @participation.status = "pending"
    if @participation.save
      redirect_to dashboard_path
    else
      redirect "missions/show", status: :unprocessable_entity
    end
  end

  def accept
    @participation = Participation.find(params[:id])
    @participation.update(status: "accepted")
    redirect_to organisation_dashboard_path, notice: "le participant #{@participation.user.username} est confirmé"
  end

  def reject
    @participation = Participation.find(params[:id])
    @participation.update(status: "rejected")
    redirect_to organisation_dashboard_path, notice: "le participant #{@participation.user.username} n'a pas été retenu"
  end
end
