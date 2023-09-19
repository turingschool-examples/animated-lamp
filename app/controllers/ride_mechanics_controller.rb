class RideMechanicsController < ApplicationController
  def create
    RideMechanic.create!(ride_id: params["Add Ride"], mechanic_id: params[:mechanic_id])
    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end