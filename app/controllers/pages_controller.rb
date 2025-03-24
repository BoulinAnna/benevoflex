class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :ensure_admin!, only: [:organisation_dashboard]

  def home
  end

  def dashboard
    @favorites = current_user.favorites
    @pending_missions = current_user.pending_missions
    @accepted_missions = current_user.accepted_missions
  end

  def organisation_dashboard
    @missions = current_user.organisations.first.missions
    @participations_per_mission = @missions.map do |mission|
      mission.participations.where(status: "pending")
    end
    @mission = Mission.new
  end

  private

  def ensure_admin!
    raise unless current_user.admin
    # render file: "#{Rails.root}/public/400.html", layout: false, status: :unauthorized unless current_user.admin
  end
end
