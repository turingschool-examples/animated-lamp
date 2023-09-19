class MechanicRidesController < ApplicationController
  def create
    mechanic_ride = MechanicRide.create(mechanic_id: params[:id], ride_id: params[:ride_id])
    redirect_to "/mechanics/#{mechanic_ride.mechanic_id}"
  end
end