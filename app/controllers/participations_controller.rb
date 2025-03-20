class ParticipationsController < ApplicationController
  def accept
    @paticipation = Participation.find(params[:id])
    @participation.update(status: "accepted")
  end

  def reject
    @paticipation = Participation.find(params[:id])
    @participation.update(status: "rejected")
  end
end
