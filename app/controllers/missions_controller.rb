class MissionsController < ApplicationController

  def show
    @mission = Mission.find(params[:id])
  end

  def index
    @missions = Mission.all
    @missions = @missions.where(address: params[:address]) if params[:address].present?
    @missions = @missions.where(category: params[:category]) if params[:category].present?
    @missions = @missions.where(start_date: params[:start_date]) if params[:start_date].present?
  end
end
