class MechanicRidesController < ApplicationController

  def create

    MechanicRide.create!(ride_id: params[:add_ride], mechanic_id: params[:id])
    # mechanic = Mechanic.find(params[:id])
    # ride = Ride.find(params[:id])
    # mechanic.rides << ride
    
    redirect_to "/mechanics/#{params[:id]}"
  end

end