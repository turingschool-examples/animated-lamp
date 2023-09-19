class RideMechanicsController < ApplicationController
  def create
    RideMechanic.create!(mechanic: Mechanic.find(params[:mechanic_id]), ride: Ride.find(params[:ride_id]))

    redirect_to(mechanic_path(Mechanic.find(params[:mechanic_id])))
  end
end