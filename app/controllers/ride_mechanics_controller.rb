class RideMechanicsController < ApplicationController
  def create
    @mechanic = Mechanic.find(params[:mechanic_id])
    @ride = Ride.find(params[:ride_id])
    @mechanic.rides << @ride
    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
