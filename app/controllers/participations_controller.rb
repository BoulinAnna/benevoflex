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
      redirect "mission/show", status: :unprocessable_entity
    end
  end

  def accept
    @paticipation = Participation.find(params[:id])
    @participation.update(status: "accepted")
  end

  def reject
    @paticipation = Participation.find(params[:id])
    @participation.update(status: "rejected")
  end
end
